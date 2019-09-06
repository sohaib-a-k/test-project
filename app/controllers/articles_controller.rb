class ArticlesController < ApplicationController
before_action :find_article, only:[:show, :edit, :destroy, :update] 


def new
@article = Article.new
end

def index
@articles = Article.all
end

def show
# we only need to find the article here, and we are doing it on top of page in before action
end

def edit
# we only need to find the article here, and we are doing it on top of page in before action
end

def destroy
# we are getting article on top of page in before action
 @article.destroy
	flash[:notice] = "Article is successfully deleted"
	redirect_to articles_path
end


def update
# we are getting article on top of page in before action
if @article.update(article_params)
	flash[:notice] = "Article has been updated successfully"
	redirect_to article_path(@article)
else
	render 'edit'
end
end

def create
@article = Article.new(article_params);
if @article.save
	flash[:notice] = "Article has been created successfully"
redirect_to article_path(@article)
else 
	render 'new'
end
end

private 
def find_article
@article = Article.find(params[:id])
end
def article_params
params.require(:article).permit(:title,:description)
end
end