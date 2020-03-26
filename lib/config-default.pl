################# デフォルト設定 #################
use strict;
use utf8;

package set;

use lib './module';

# config.cgiのほうが優先されます
# 変更する場合は同様の項目をconfig.cgiに追記してください
# （CGIアップデート時に上書きされるため）
  
## ●タイトル
  our $title = 'ゆとシートⅡ for DX3rd';

## ●管理パスワード
  our $masterkey = '';
  
## ●管理人ユーザーID (指定したIDは非表示のシートの閲覧や全シートの編集ができます)
  our $masterid = '';

## ●登録関係
 # 登録キー
  our $registerkey = '';
 # データ作成・編集にユーザー登録（ログイン状態）を必須にする
  our $user_reqd = 0;
 # キャラクター・魔物のIDをランダムではなくユーザーID＋番号(001,002..)にする(魔物はm001..)
  our $id_type = 0;

## ●OAuth2 でのログイン関係
 # OAuth2 を提供するサービスの名称。現在 Discord と Google のみ対応
  our $oauth_service = '';
 # OAuth2 で利用するサービスにユーザがログインするための URL
  our $oauth_login_url = '';
 # OAuth2 で利用するサービスから払い出される client_id
  our $oauth_client_id = '';
 # OAuth2 で利用するサービスから払い出される client_secret
  our $oauth_secret_id = '';
 # ゆとシート2 の URL のうち index.cgi を oauth.cgi に置換したものを URI エンコードしたもの
 # 例: https://yutorize.2-d.jp/ytsheet/sw2.5/index.cgi ならば  https%3A%2F%2Fyutorize.2-d.jp%2Fytsheet%2Fsw2.5%2Foauth.cgi
  our $oauth_redirect_url = '';
 # OAuth2 のスコープ
  our $oauth_scope = '';

 # OAuth で Discord を利用する場合のみ利用可能 ログインを許可する Discord のサーバ一覧。空リストの場合は制限しない
  our @oauth_discord_login_servers = (); 

## ●画像関係
 # キャラクター画像のファイルサイズ上限(単位byte)
  our $image_maxsize = 1024 * 1024 * 1;


## ●削除関係
 # データを削除するとき、バックアップも削除 する=1 しない=0
  our $del_back = 0;

## ●一覧表示関係
 # キャラクター一覧を簡易表示にする
  our $simplelist = 0; 

## ●グループ設定
 # ["ID", "ソート順(空欄で非表示)", "分類名", "分類の説明文"],
 # 選択時はここで書いた順番、キャラ一覧(グループ別)ではソート順で数字が小さい方から表示されます
 # 増減OK
  our @groups = (
    ["pc",  "01", "ＰＣ", "プレイヤーキャラクター"],
    ["npc", "99", "ＮＰＣ", "ノンプレイヤーキャラクター"],
  );

 # デフォルトのグループID
  our $group_default = 'pc';

 # トップページのキャラクター最大表示数（1グループあたり／無制限=0）
  our $list_maxline = 0;

 # グループ個別表示時や検索結果表示時の1ページあたりの最大表示数（0で全部表示）
  our $pagemax = 0;


## ●キャラクターシートの各種初期値
  our $make_exp = 130;


## ●Cookie
 # Cookieの名前
  our $cookie = 'ytsheet2';

## ●各種ファイルへのパス
  our $sendmail = '/usr/sbin/sendmail'; # sendmailのパス
  
  our $data_dir = './data/'; # データ格納ディレクトリ
  our $userfile = $data_dir . 'users.cgi';    # ユーザー一覧ファイル
  our $passfile = $data_dir . 'charpass.cgi'; # パスワード記録ファイル
  our $listfile = $data_dir . 'charlist.cgi'; # キャラクター一覧ファイル
  our $char_dir = $data_dir . 'chara/'; # キャラクターデータ格納ディレクトリ
  
  our $lib_edit      = './lib/common/edit.pl';
  our $lib_save      = './lib/common/save.pl';
  our $lib_view      = './lib/common/view.pl';
  our $lib_json      = './lib/common/json.pl';
  
  our $lib_edit_char = './lib/dx3/edit-chara.pl';
  our $lib_save_char = './lib/dx3/save-chara.pl';
  our $lib_view_char = './lib/dx3/view-chara.pl';
  our $lib_palette   = './lib/dx3/palette.pl';
  our $lib_list_char = './lib/dx3/list-chara.pl';
  our $lib_making    = './lib/dx3/making.pl';
  our $lib_list_make = './lib/dx3/list-making.pl';
  
  our $lib_delete = './lib/common/delete.pl';
  
  our $lib_form    = './lib/common/form.pl';
  our $lib_info    = './lib/common/info.pl';
  our $lib_register= './lib/common/register.pl';
  our $lib_reminder= './lib/common/reminder.pl';
  our $login_users = './tmp/login_users.cgi';
  
  our $tokenfile  = './tmp/token.cgi'; 

  our $data_syndrome = './lib/dx3/data-syndrome.pl';  # シンドロームのデータ

  our $icon_dir  = './skin/img/'; # 武器アイコンのあるディレクトリ
  
  our $skin_tmpl  = './skin/template.html'; # 一覧など
  our $skin_sheet = './skin/sheet-chara.html';    # キャラクターシート


1;