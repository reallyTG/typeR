library(MXM)


### Name: Forward Backward Early Dropping selection regression with GLMM
### Title: Forward Backward Early Dropping selection regression with GLMM
### Aliases: fbed.glmm.reg

### ** Examples

## Not run: 
##D require(lme4)
##D data(sleepstudy)
##D attach(sleepstudy)
##D x <- matrix(rnorm(180 * 20),ncol = 20) ## unrelated preidctor variables
##D m1 <- fbed.glmm.reg(Reaction, x, Subject) 
##D m2 <- MMPC.glmm(target = Reaction, group = Subject, dataset = x)
## End(Not run)



