library(FDRreg)


### Name: plotFDR
### Title: Plot an FDR regression model.
### Aliases: plotFDR

### ** Examples


library(FDRreg)

# Simulated data
P = 2
N = 10000
betatrue = c(-3.5,rep(1/sqrt(P), P))
X = matrix(rnorm(N*P), N,P)
psi = crossprod(t(cbind(1,X)), betatrue)
wsuccess = 1/{1+exp(-psi)}

# Some theta's are signals, most are noise
gammatrue = rbinom(N,1,wsuccess)
table(gammatrue)

# Density of signals
thetatrue = rnorm(N,3,0.5)
thetatrue[gammatrue==0] = 0
z = rnorm(N, thetatrue, 1)
hist(z, 100, prob=TRUE, col='lightblue', border=NA)
curve(dnorm(x,0,1), add=TRUE, n=1001)

## Not run: 
##D # Fit the model
##D fdr1 <- FDRreg(z, covars=X, nmc=2500, nburn=100, nmids=120, nulltype='theoretical')
##D # Show the empirical-Bayes estimate of the mixture density
##D # and the findings at a specific FDR level
##D Q = 0.1
##D plotFDR(fdr1, Q=Q, showfz=TRUE)
## End(Not run)



