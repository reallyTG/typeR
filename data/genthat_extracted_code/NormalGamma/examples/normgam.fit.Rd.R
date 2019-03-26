library(NormalGamma)


### Name: normgam.fit
### Title: Normal-gamma Maximum Likelihood Estimator
### Aliases: normgam.fit
### Keywords: normal gamma maximum likelihood

### ** Examples


# Example 1: simulated data

## Not run: 
##D 
##D n = 1000
##D par = c(60,5,0.15,400)
##D X = rnorm(n, mean=par[1], sd=par[2]) + rgamma(n, shape=par[3], scale=par[4]) 
##D N = rnorm(100, mean=par[1], sd=par[2])
##D 
##D par1 = normgam.fit(X, N)$par
##D par2 = normgam.fit(X)$par
##D 
##D 
##D F1 = dnormgam(par1, plot=FALSE)
##D F2 = dnormgam(par2, plot=FALSE)
##D 
##D par(mfrow=c(2,1))
##D 
##D H = histogram(X, type='irregular', verbose=FALSE, plot=FALSE)
##D 
##D plot(H, xlim=c(0,500))
##D lines(F1$xout, F1$dout,col='red')
##D 
##D plot(H, xlim=c(0,500))
##D lines(F2$xout, F2$dout,col='blue')
## End(Not run)

# Example 2: Illumina data

## Not run: 
##D 
##D data(RegNegIntensities_Example)
##D  
##D X = Intensities$Regular
##D N = Intensities$Negative
##D 
##D par1 = normgam.fit(X, N)$par
##D par2 = normgam.fit(X)$par
##D 
##D F1 = dnormgam(par1, plot=FALSE)
##D F2 = dnormgam(par2, plot=FALSE)
##D 
##D par(mfrow=c(2,1))
##D 
##D H = histogram(X, type='irregular', verbose=FALSE, plot=FALSE)
##D 
##D plot(H, xlim=c(0,500))
##D lines(F1$xout, F1$dout, col='red')
##D 
##D plot(H, xlim=c(0,500))
##D lines(F2$xout, F2$dout, col='blue')
## End(Not run)




