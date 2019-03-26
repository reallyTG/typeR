library(refund)


### Name: vis.pfr
### Title: Visualization of PFR objects
### Aliases: vis.pfr

### ** Examples

################# DTI Example #####################
data(DTI)

## only consider first visit and cases (since no PASAT scores for controls),
## and remove missing data
DTI <- DTI[DTI$visit==1 & DTI$case==1 & complete.cases(DTI$cca),]

## Fit the PFR using FA measurements along corpus
## callosum as functional predictor with PASAT as response
## using 8 cubic B-splines for each marginal bases with
## third order marginal difference penalties.
## Specifying gamma>1 enforces more smoothing when using GCV
## to choose smoothing parameters
fit <- pfr(pasat ~ af(cca, basistype="te", k=c(8,8), m=list(c(2,3),c(2,3)), bs="ps"),
           method="GCV.Cp", gamma=1.2, data=DTI)

## contour plot of the fitted surface
vis.pfr(fit, plot.type='contour')

## similar to Figure 5 from McLean et al.
## Bands seem too conservative in some cases
xval <- runif(1, min(fit$pfr$ft[[1]]$Xrange), max(fit$pfr$ft[[1]]$Xrange))
tval <- runif(1, min(fit$pfr$ft[[1]]$xind), max(fit$pfr$ft[[1]]$xind))
par(mfrow=c(2, 2))
vis.pfr(fit, deriv2=FALSE, xval=xval)
vis.pfr(fit, deriv2=FALSE, tval=tval)
vis.pfr(fit, deriv2=TRUE, xval=xval)
vis.pfr(fit, deriv2=TRUE, tval=tval)



