library(ncvreg)


### Name: AUC.cv.ncvsurv
### Title: Calculates AUC for cv.ncvsurv objects
### Aliases: AUC AUC.cv.ncvsurv

### ** Examples

data(Lung)
X <- Lung$X
y <- Lung$y

cvfit <- cv.ncvsurv(X, y, returnY=TRUE)
head(AUC(cvfit))
lam <- cvfit$lambda
plot(lam, AUC(cvfit), xlim=rev(range(lam)), lwd=3, type='l',
     las=1, xlab=expression(lambda), ylab='AUC')



