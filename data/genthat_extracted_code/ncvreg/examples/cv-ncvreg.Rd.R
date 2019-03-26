library(ncvreg)


### Name: cv.ncvreg
### Title: Cross-validation for ncvreg/ncvsurv
### Aliases: cv.ncvreg cv.ncvsurv

### ** Examples

data(Prostate)

cvfit <- cv.ncvreg(Prostate$X, Prostate$y)
plot(cvfit)
summary(cvfit)

fit <- cvfit$fit
plot(fit)
beta <- fit$beta[,cvfit$min]

## requires loading the parallel package
## Not run: 
##D library(parallel)
##D X <- Prostate$X
##D y <- Prostate$y
##D cl <- makeCluster(4)
##D cvfit <- cv.ncvreg(X, y, cluster=cl, nfolds=length(y))
## End(Not run)

# Survival
data(Lung)
X <- Lung$X
y <- Lung$y

cvfit <- cv.ncvsurv(X, y)
summary(cvfit)
plot(cvfit)
plot(cvfit, type="rsq")



