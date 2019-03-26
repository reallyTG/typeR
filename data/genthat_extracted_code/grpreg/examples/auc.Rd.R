library(grpreg)


### Name: AUC.cv.grpsurv
### Title: Calculates AUC for cv.grpsurv objects
### Aliases: AUC AUC.cv.grpsurv

### ** Examples

## Don't show: 
set.seed(1)
## End(Don't show)
data(Lung)
X <- Lung$X
y <- Lung$y
group <- Lung$group

cvfit <- cv.grpsurv(X, y, group, returnY=TRUE)
head(AUC(cvfit))
ll <- log(cvfit$fit$lambda)
plot(ll, AUC(cvfit), xlim=rev(range(ll)), lwd=3, type='l',
     xlab=expression(log(lambda)), ylab='AUC', las=1)



