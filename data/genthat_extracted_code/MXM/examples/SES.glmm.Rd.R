library(MXM)


### Name: Constraint based feature selection algorithms for longitudinal and clustered data
### Title: SES.glmm/SES.gee: Feature selection algorithm for identifying
###   multiple minimal, statistically-equivalent and equally-predictive
###   feature signatures with correlated data
### Aliases: SES.glmm MMPC.glmm MMPC.gee SES.gee
### Keywords: SES Mixed models Longitudinal data Variable Selection

### ** Examples

## Not run: 
##D require(lme4)
##D data(sleepstudy)
##D attach(sleepstudy)
##D x <- matrix(rnorm(180 * 100),ncol = 100) ## unrelated preidctor variables
##D m1 <- SES.glmm(Reaction, Days, Subject, x)
##D m2 <- MMPC.glmm(Reaction, Days, Subject, x)
## End(Not run)



