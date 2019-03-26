library(STAR)


### Name: gampsth
### Title: Smooth Peri Stimulus Time Histogram Related Functions and
###   Methods: The Penalized Regression Spline Approach
### Aliases: gampsth print.gampsth summary.gampsth plot.gampsth
### Keywords: models smooth regression

### ** Examples

## Not run: 
##D ## Get the e070528citronellal data set into workspace
##D data(e070528citronellal)
##D ## Compute gampsth without a plot for neuron 1
##D ## using a cubic regression spline
##D n1CitrGAMPSTH <- gampsth(e070528citronellal[[1]],plot=FALSE,bs="cr")
##D ## plot the result
##D plot(n1CitrGAMPSTH,stim=c(6.14,6.64),colCI=2)
##D ## get a summary of the gam fit
##D summary(n1CitrGAMPSTH)
##D ## perhaps get a more complete check wit gam.check
##D n1CitrGAMPSTHgo <- gamObj(n1CitrGAMPSTH)
##D gam.check(n1CitrGAMPSTHgo)
##D ## It does not look too bad
##D ## Now take a look at the observation on which the gam
##D ## was actually performed
##D plot(n1CitrGAMPSTH$mids,n1CitrGAMPSTH$counts,type="l")
##D ## put dots at the positions of the knots
##D X <- n1CitrGAMPSTHgo$smooth[[1]][["xp"]]
##D rug(X,col=2)
##D ## Add the estimated smooth psth after proper scaling
##D theBS <- diff(n1CitrGAMPSTH[["mids"]])[1]
##D Y <- n1CitrGAMPSTH$lambdaFct(n1CitrGAMPSTH$mids)*theBS*n1CitrGAMPSTH$nbTrials
##D lines(n1CitrGAMPSTH$mids,Y,col=4,lwd=2)
## End(Not run)


