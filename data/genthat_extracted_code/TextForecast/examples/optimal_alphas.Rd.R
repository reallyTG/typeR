library(TextForecast)


### Name: optimal_alphas
### Title: Title optimal alphas function
### Aliases: optimal_alphas

### ** Examples


set.seed(1)
data("stock_data")
data("news_data")
y=as.matrix(stock_data[1:200,2])
w=as.matrix(stock_data[1:200,3])
data("news_data")
X=news_data[1:200,2:ncol(news_data)]
x=as.matrix(X)
grid_alphas=seq(by=0.25,to=1,from=0.5)
cont_folds=TRUE
t=length(y)
optimal_alphas=optimal_alphas(x[1:(t-1),],
w[1:(t-1),],y[2:t],grid_alphas,TRUE,"gaussian")




