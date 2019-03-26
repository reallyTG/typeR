library(rqPen)


### Name: cv.rq.group.pen
### Title: Cross Validated quantile regression with group penalty
### Aliases: cv.rq.group.pen

### ** Examples
                           
## Not run: 
##D x <- matrix(rnorm(800),nrow=100)
##D y <- 1 + x[,1] - 3*x[,5] + rnorm(100)
##D cv_model <- cv.rq.group.pen(x,y,groups=c(rep(1,4),rep(2,4)))
## End(Not run)



