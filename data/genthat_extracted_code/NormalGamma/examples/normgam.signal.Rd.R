library(NormalGamma)


### Name: normgam.signal
### Title: Normal-gamma background correction
### Aliases: normgam.signal
### Keywords: normal gamma convolution background correction

### ** Examples


#Example 1: simulated data

n = 50000
par = c(60,5,0.15,400)
S = rgamma(n, shape=par[3], scale=par[4])
B = rnorm(n, mean=par[1], sd=par[2]) 
X = S + B

par(mfrow=c(2,1))

Shat1 = normgam.signal(X, par)
H1 = histogram(Shat1, type='irregular', verbose=FALSE, plot=FALSE)
plot(H1, xlim=c(0,50))
I = seq(from=0, to=50, length=1000)
lines(I, dgamma(I, shape=0.15, scale=400), col='red')

Shat2 = normgam.signal(X, par, gshift = TRUE)
H2 = hist(Shat2, 10000, plot=FALSE)
plot(H2, xlim=c(0,50), freq=FALSE)
lines(I, dgamma(I, shape=0.15, scale=400), col='red')


#Example 2: Illumina data

## Not run: 
##D 
##D data(RegNegIntensities_Example)
##D 
##D X = Intensities$Regular
##D N = Intensities$Negative
##D 
##D # parameter estimation
##D parmle = normgam.fit(X, N)$par 
##D 
##D Shat = normgam.signal(X,parmle)
##D H = histogram(Shat, type='irregular', verbose=FALSE, plot=FALSE)
##D plot(H, xlim=c(0,30))
## End(Not run)




