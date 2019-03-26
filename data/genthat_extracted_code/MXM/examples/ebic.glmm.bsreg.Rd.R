library(MXM)


### Name: Backward selection regression for GLMM using the eBIC
### Title: Backward selection regression for GLMM using the eBIC
### Aliases: ebic.glmm.bsreg

### ** Examples

## Not run: 
##D require(lme4)
##D data(sleepstudy)
##D attach(sleepstudy)
##D x <- matrix(rnorm(180 * 20),ncol = 20) ## unrelated preidctor variables
##D m1 <- ebic.glmm.bsreg(Reaction, x, Subject, wei = NULL, gam = NULL, type = "gaussian") 
##D m2 <- MMPC.glmm(target = Reaction, group = Subject, dataset = x)
## End(Not run)



