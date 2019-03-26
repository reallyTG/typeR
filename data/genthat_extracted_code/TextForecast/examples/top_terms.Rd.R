library(TextForecast)


### Name: top_terms
### Title: Top Terms Function
### Aliases: top_terms

### ** Examples

## No test: 
set.seed(1)
data("stock_data")
data("news_data")
y=as.matrix(stock_data[,2])
w=as.matrix(stock_data[,3])
data("news_data")
X=news_data[,2:ncol(news_data)]
x=as.matrix(X)
grid_alphas=seq(by=0.05,to=0.95,from=0.05)
cont_folds=TRUE
t=length(y)
optimal_alphas=optimal_alphas(x[1:(t-1),],w[1:(t-1),],
y[2:t],grid_alphas,TRUE,"gaussian")
top_trms<- top_terms(x[1:(t-1),],w[1:(t-1),],y[2:t],
optimal_alphas[[1]], optimal_alphas[[2]],10,TRUE,
10,c(2,0.3),.15,"gaussian")
## End(No test)




