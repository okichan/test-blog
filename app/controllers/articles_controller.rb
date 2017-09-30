class ArticlesController < ApplicationController
    before_action :set_article, only: [:show, :edit, :update, :destroy] 

    def index
        @articles = Article.all.order('created_at DESC')
    end

    def show
        # set_article
    end

    def new
        @article = Article.new
    end    
    
    def edit
        # @article = Article.find(params[:id])  
    end

    def create
        @article = Article.new(article_params)
        
        if @article.save
            redirect_to article_path(@article)
        else
            render 'new'
        end        
    end
    
    def update
        # @article = Article.find(params[:id])
        if @article.update(article_params)
            redirect_to article_path(@article)
        else
            render 'edit'            
        end
    end

    def destroy
        # @article = Article.find(params[:id])
        @article.destroy
        redirect_to @article
    end

    private
    def article_params
        params.require(:article).permit(:title, :text)
    end

    def set_article
        @article = Article.find(params[:id])
    end

end
