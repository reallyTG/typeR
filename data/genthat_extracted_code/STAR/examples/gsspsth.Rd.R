library(STAR)


### Name: gsspsth
### Title: Smooth Peri Stimulus Time Histogram Related Functions and
###   Methods: The Smoothing Spline Approach
### Aliases: gsspsth gsspsth0 print.gsspsth print.gsspsth0 summary.gsspsth
###   summary.gsspsth0 plot.gsspsth plot.gsspsth0 simulate.gsspsth0
###   simulate.gsspsth
### Keywords: models smooth regression

### ** Examples

## Not run: 
##D ## Get the e070528citronellal data set into workspace
##D data(e070528citronellal)
##D ## Compute gsspsth without a plot for neuron 1
##D ## using a smmothing spline with gssanova0, and default bin size of 25 ms.
##D n1CitrGSSPSTH0 <- gsspsth0(e070528citronellal[[1]])
##D ## plot the result
##D plot(n1CitrGSSPSTH0,stim=c(6.14,6.64),colCI=2)
##D ## get a summary of the gss fit
##D summary(n1CitrGSSPSTH0)
##D ## Now take a look at the observation on which the gss
##D ## was actually performed
##D plot(n1CitrGSSPSTH0$mids,n1CitrGSSPSTH0$counts,type="l")
##D ## Add the estimated smooth psth after proper scaling
##D theBS <- diff(n1CitrGSSPSTH0[["mids"]])[1]
##D Y <- n1CitrGSSPSTH0$lambdaFct(n1CitrGSSPSTH0$mids)*theBS*n1CitrGSSPSTH0$nbTrials
##D lines(n1CitrGSSPSTH0$mids,Y,col=4,lwd=2)
##D 
##D ## check the (absence of) effect of the pre-binning by using a smaller
##D ## and larger one, say 10 and 75 ms
##D n1CitrGSSPSTH0_10 <- gsspsth0(e070528citronellal[[1]],binSize=0.01)
##D n1CitrGSSPSTH0_75 <- gsspsth0(e070528citronellal[[1]],binSize=0.075)
##D ## plot the "high resolution" smoothed-psth
##D plot(n1CitrGSSPSTH0_10,colCI="grey50")
##D ## add to it the estimate obtained with the "low resolution" one
##D Y_75 <- n1CitrGSSPSTH0_75$lambdaFct(n1CitrGSSPSTH0_10$mids)
##D lines(n1CitrGSSPSTH0_10$mids,Y_75,col=2,lwd=2)
##D 
##D ## simulate data from the first fitted model
##D s1 <- simulate(n1CitrGSSPSTH0)
##D ## look at the result
##D s1
##D 
##D ## Do the same thing with gsspsth
##D n1CitrGSSPSTH <- gsspsth(e070528citronellal[[1]])
##D plot(n1CitrGSSPSTH,stim=c(6.14,6.64),colCI=2)
##D summary(n1CitrGSSPSTH)
##D plot(n1CitrGSSPSTH$mids,n1CitrGSSPSTH$counts,type="l")
##D theBS <- diff(n1CitrGSSPSTH[["mids"]])[1]
##D Y <- n1CitrGSSPSTH$lambdaFct(n1CitrGSSPSTH$mids)*theBS*n1CitrGSSPSTH$nbTrials
##D lines(n1CitrGSSPSTH$mids,Y,col=4,lwd=2)
##D ## check the (absence of) effect of the pre-binning by using a smaller
##D ## and larger one, say 10 and 75 ms
##D n1CitrGSSPSTH_10 <- gsspsth(e070528citronellal[[1]],binSize=0.01)
##D n1CitrGSSPSTH_75 <- gsspsth(e070528citronellal[[1]],binSize=0.075)
##D ## plot the "high resolution" smoothed-psth
##D plot(n1CitrGSSPSTH_10,colCI="grey50")
##D ## add to it the estimate obtained with the "low resolution" one
##D Y_75 <- n1CitrGSSPSTH_75$lambdaFct(n1CitrGSSPSTH_10$mids)
##D lines(n1CitrGSSPSTH_10$mids,Y_75,col=2,lwd=2)
##D ## simulate data from the first fitted model
##D s1 <- simulate(n1CitrGSSPSTH)
##D ## look at the result
##D s1
## End(Not run)



