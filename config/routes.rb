Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'tweets#index'
  resources :tweets do
    resources :comments, only: :create
    # 何か情報を送るときにはネスト構造になる 例:app/views/tweets/show.html.erb
    collection do
      get 'search'
    end
  end
  resources :users, only: :show
end
