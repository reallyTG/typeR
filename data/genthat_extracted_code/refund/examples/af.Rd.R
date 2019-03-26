library(refund)


### Name: af
### Title: Construct an FGAM regression term
### Aliases: af

### ** Examples

## Not run: 
##D data(DTI)
##D ## only consider first visit and cases (no PASAT scores for controls)
##D DTI1 <- DTI[DTI$visit==1 & DTI$case==1,]
##D DTI2 <- DTI1[complete.cases(DTI1),]
##D 
##D ## fit FGAM using FA measurements along corpus callosum
##D ## as functional predictor with PASAT as response
##D ## using 8 cubic B-splines for marginal bases with third
##D ## order marginal difference penalties
##D ## specifying gamma > 1 enforces more smoothing when using
##D ## GCV to choose smoothing parameters
##D fit1 <- pfr(pasat ~ af(cca, k=c(8,8), m=list(c(2,3), c(2,3)),
##D                        presmooth="bspline", bs="ps"),
##D             method="GCV.Cp", gamma=1.2, data=DTI2)
##D plot(fit1, scheme=2)
##D vis.pfr(fit1)
##D 
##D ## af term for the cca measurements plus an lf term for the rcst measurements
##D ## leave out 10 samples for prediction
##D test <- sample(nrow(DTI2), 10)
##D fit2 <- pfr(pasat ~ af(cca, k=c(7,7), m=list(c(2,2), c(2,2)), bs="ps",
##D                        presmooth="fpca.face") +
##D                     lf(rcst, k=7, m=c(2,2), bs="ps"),
##D             method="GCV.Cp", gamma=1.2, data=DTI2[-test,])
##D par(mfrow=c(1,2))
##D plot(fit2, scheme=2, rug=FALSE)
##D vis.pfr(fit2, select=1, xval=.6)
##D pred <- predict(fit2, newdata = DTI2[test,], type='response', PredOutOfRange = TRUE)
##D sqrt(mean((DTI2$pasat[test] - pred)^2))
##D 
##D ## Try to predict the binary response disease status (case or control)
##D ##   using the quantile transformed measurements from the rcst tract
##D ##   with a smooth component for a scalar covariate that is pure noise
##D DTI3 <- DTI[DTI$visit==1,]
##D DTI3 <- DTI3[complete.cases(DTI3$rcst),]
##D z1 <- rnorm(nrow(DTI3))
##D fit3 <- pfr(case ~ af(rcst, k=c(7,7), m = list(c(2, 1), c(2, 1)), bs="ps",
##D                       presmooth="fpca.face", Qtransform=TRUE) +
##D                     s(z1, k = 10), family="binomial", select=TRUE, data=DTI3)
##D par(mfrow=c(1,2))
##D plot(fit3, scheme=2, rug=FALSE)
##D abline(h=0, col="green")
##D 
##D # 4 versions: fit with/without Qtransform, plotted with/without Qtransform
##D fit4 <- pfr(case ~ af(rcst, k=c(7,7), m = list(c(2, 1), c(2, 1)), bs="ps",
##D                       presmooth="fpca.face", Qtransform=FALSE) +
##D                     s(z1, k = 10), family="binomial", select=TRUE, data=DTI3)
##D par(mfrow=c(2,2))
##D zlms <- c(-7.2,4.3)
##D plot(fit4, select=1, scheme=2, main="QT=FALSE", zlim=zlms, xlab="t", ylab="rcst")
##D plot(fit4, select=1, scheme=2, Qtransform=TRUE, main="QT=FALSE", rug=FALSE,
##D      zlim=zlms, xlab="t", ylab="p(rcst)")
##D plot(fit3, select=1, scheme=2, main="QT=TRUE", zlim=zlms, xlab="t", ylab="rcst")
##D plot(fit3, select=1, scheme=2, Qtransform=TRUE, main="QT=TRUE", rug=FALSE,
##D      zlim=zlms, xlab="t", ylab="p(rcst)")
##D 
##D vis.pfr(fit3, select=1, plot.type="contour")
## End(Not run)




