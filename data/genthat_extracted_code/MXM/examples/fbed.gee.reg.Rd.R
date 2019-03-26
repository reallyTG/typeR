library(MXM)


### Name: Forward Backward Early Dropping selection regression with GEE
### Title: Forward Backward Early Dropping selection regression with GEE
### Aliases: fbed.gee.reg

### ** Examples

## Not run: 
##D require(lme4)
##D data(sleepstudy)
##D attach(sleepstudy)
##D x <- matrix(rnorm(180 * 20),ncol = 20) ## unrelated preidctor variables
##D m1 <- fbed.gee.reg(Reaction, x, Subject) 
##D m2 <- fbed.glmm.reg(Reaction, x, Subject, backward = FALSE) 
## End(Not run)



