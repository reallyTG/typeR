library(rqPen)


### Name: groupMultLambda
### Title: Quantile Regression with Group Penalty for multiple lambdas
### Aliases: groupMultLambda

### ** Examples

## Not run: 
##D x <- matrix(rnorm(400),nrow=100)
##D y <- 1 + x[,1] - 3*x[,3] + rnorm(100)
##D cv_model <- groupMultLambda(x,y,groups=c(rep(1,2),rep(2,2)),lambda=seq(.1,.5,.1))
## End(Not run)



