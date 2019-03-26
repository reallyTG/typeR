library(NormalGamma)


### Name: NormalGamma-package
### Title: Background correction using the normal+gamma model
### Aliases: NormalGamma-package NormalGamma
### Keywords: package

### ** Examples


# Load Illumina microarray data previously transformed into two sets of intensities
# corresponding to negative and regular probes.

## Not run: 
##D 
##D data(RegNegIntensities_Example)
##D 
##D X = Intensities$Regular
##D N = Intensities$Negative
##D 
##D ## Compute the maximum likelihood estimator:
##D parmle = normgam.fit(X, N)$par
##D 
##D par(mfrow=c(2,1)) # split windows for post comparison
##D 
##D ## plot the histogram and the estimated density:
##D F = dnormgam(parmle, plot=FALSE) 
##D 
##D 
##D H = histogram(X, type='irregular', verbose=FALSE, plot=FALSE) 
##D plot(H, xlim=c(0,500))
##D lines(F$xout, F$dout, col='red')
##D 
##D # Perform the normal-gamma background correction: 
##D Shat = normgam.signal(X,parmle)
##D H = histogram(Shat, type='irregular', verbose=FALSE, plot=FALSE) 
##D plot(H, xlim=c(0,30))
##D 
## End(Not run)







