library(MXM)


### Name: Backward selection regression for GLMM
### Title: Backward selection regression for GLMM
### Aliases: glmm.bsreg

### ** Examples

## Not run: 
##D require(lme4)
##D data(sleepstudy)
##D attach(sleepstudy)
##D x <- matrix(rnorm(180 * 20),ncol = 20) ## unrelated preidctor variables
##D m1 <- glmm.bsreg(Reaction, x, Subject, wei = NULL, gam = NULL, type = "gaussian") 
##D m2 <- MMPC.glmm(target = Reaction, group = Subject, dataset = x)
## End(Not run)



