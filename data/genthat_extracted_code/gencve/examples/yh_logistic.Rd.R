library(gencve)


### Name: yh_logistic
### Title: Logistic Regression and Regularized Logistic Regression
###   Prediction
### Aliases: yh_logistic
### Keywords: models classif

### ** Examples

z <- kyphosis[,c(2:4,1)]
set.seed(37771)
i <- sample(1:81, size=7, replace=TRUE)
dfTe <- z[i,]
i <- setdiff(1:81, i)
dfTr <- z[i,]
yh_logistic(dfTr, dfTe)
yh_logistic(dfTr, dfTe, alpha=1)
## Not run: 
##D #cross-validation, takes a few minutes
##D X <- kyphosis[,3:4]
##D y <- kyphosis[,4]
##D cgcv(X, y, yh=yh_logistic, NCores=8)
##D cgcv(X, y, yh=yh_logistic, NCores=8, alpha=1)
##D cgcv(X, y, yh=yh_logistic, NCores=8, alpha=0.5)
##D cgcv(X, y, yh=yh_logistic, NCores=8, alpha=0.02)
##D #
## End(Not run)



