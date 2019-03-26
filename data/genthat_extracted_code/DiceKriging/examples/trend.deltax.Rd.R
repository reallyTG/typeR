library(DiceKriging)


### Name: trend.deltax
### Title: Trend derivatives
### Aliases: trend.deltax
### Keywords: models optimize internal

### ** Examples

X <- expand.grid(x1=seq(0,1,length=4), x2=seq(0,1,length=4), x3=seq(0,1,length=4))
fun <- function(x){
  (x[1]+2*x[2]+3*x[3])^2
}
y <- apply(X, 1, fun) 

x <- c(0.2, 0.4, 0.6)
coef.cov=c(0.5, 0.9, 1.3); coef.var=3

m <- km(~.^2, design=X, response=y, coef.cov=coef.cov, coef.var=coef.var)
grad.trend <- trend.deltax(x, m)
print(grad.trend)



