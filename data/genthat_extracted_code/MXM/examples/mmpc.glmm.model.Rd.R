library(MXM)


### Name: Generalised linear mixed models based on glmm SES and MMPC outputs
### Title: Generalised linear mixed model(s) based obtained from glmm SES
###   or MMPC
### Aliases: mmpc.glmm.model ses.glmm.model mmpc.gee.model ses.gee.model
### Keywords: Regression modelling

### ** Examples

## Not run: 
##D require(lme4)
##D data(sleepstudy)
##D attach(sleepstudy)
##D x <- matrix(rnorm(180 * 100),ncol = 100) ## unrelated predictor variables
##D m1 <- SES.glmm(Reaction, Days, Subject, x)
##D m2 <- MMPC.glmm(Reaction, Days, Subject, x)
##D mod <- mmpc.glmm.model(target, dataset = x, reps = Days, group = Subject, slopes = FALSE, 
##D mmpcglmm.Object = m2) 
## End(Not run)



