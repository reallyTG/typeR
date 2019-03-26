library(rqPen)


### Name: nonzero.cv.rq.group.pen
### Title: Nonzero
### Aliases: nonzero.cv.rq.group.pen

### ** Examples

## Not run: 
##D x <- matrix(rnorm(400),nrow=100)
##D y <- 1 + x[,1] - 3*x[,3] + rnorm(100)
##D cv_model <- cv.rq.group.pen(x,y,groups=c(rep(1,2),rep(2,2)))
##D nonzero(cv_model)
## End(Not run)



