library(refund)


### Name: vis.fgam
### Title: Visualization of FGAM objects
### Aliases: vis.fgam

### ** Examples

################# DTI Example #####################
data(DTI)

## only consider first visit and cases (since no PASAT scores for controls)
y <- DTI$pasat[DTI$visit==1 & DTI$case==1]
X <- DTI$cca[DTI$visit==1 & DTI$case==1,]

## remove samples containing missing data
ind <- rowSums(is.na(X))>0

y <- y[!ind]
X <- X[!ind,]

## fit the fgam using FA measurements along corpus
## callosum as functional predictor with PASAT as response
## using 8 cubic B-splines for each marginal bases with
## third order marginal difference penalties
## specifying gamma>1 enforces more smoothing when using GCV
## to choose smoothing parameters
fit <- fgam(y~af(X,splinepars=list(k=c(8,8),m=list(c(2,3),c(2,3)))),gamma=1.2)

## contour plot of the fitted surface
vis.fgam(fit,plot.type='contour')

## similar to Figure 5 from McLean et al.
## Bands seem too conservative in some cases
xval <- runif(1, min(fit$fgam$ft[[1]]$Xrange), max(fit$fgam$ft[[1]]$Xrange))
tval <- runif(1, min(fit$fgam$ft[[1]]$xind), max(fit$fgam$ft[[1]]$xind))
par(mfrow=c(4, 1))
vis.fgam(fit, af.term='X', deriv2=FALSE, xval=xval)
vis.fgam(fit, af.term='X', deriv2=FALSE, tval=tval)
vis.fgam(fit, af.term='X', deriv2=TRUE, xval=xval)
vis.fgam(fit, af.term='X', deriv2=TRUE, tval=tval)



