library(MXM)


### Name: Fast MMPC for longitudinal and clustered data
### Title: mmpc.glmm2/mmpc.gee2: Fast Feature selection algorithm for
###   identifying minimal feature subsets with correlated data
### Aliases: mmpc.glmm2 mmpc.gee2
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



