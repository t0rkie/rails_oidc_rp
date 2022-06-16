Rails.application.routes.draw do
  # get 'introspections/index' # コメントアウト
  # get 'home/index'
  # get 'sessions/create'
  # get 'sessions/destroy'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  
  # ルート設定
  root to: 'home#index'

  # 下のOPからのコールバックURIにマッチする前にマッチしたいのでここで設定
  # introspection_rpのコールバック先
  get 'auth/introspection/callback', to: 'introspections#callback'
  get 'introspection', to: 'introspections#index'

  # OPからのコールバックURI
  get 'auth/:provider/callback', to: 'sessions#create'

  # 認証に失敗したときのルーティング
  get 'auth/failure', to: redirect('/')

  # ログアウト
  get 'logout', to: 'sessions#destroy'
end
