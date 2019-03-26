library(FDRreg)


### Name: FDRreg
### Title: False Discovery Rate Regression
### Aliases: FDRreg
### Keywords: logistic regression false discovery rate FDR

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
##D 
##D 
##D # Show the empirical-Bayes estimate of the mixture density
##D # and the findings at a specific FDR level
##D Q = 0.1
##D plotFDR(fdr1, Q=Q, showfz=TRUE)
##D 
##D # Posterior distribution of the intercept
##D hist(fdr1$betasave[,1], 20)
##D 
##D # Compare actual versus estimated prior probabilities of being a signal
##D plot(wsuccess, fdr1$priorprob)
##D 
##D # Covariate effects
##D plot(X[,1], log(fdr1$priorprob/{1-fdr1$priorprob}), ylab='Logit of prior probability')
##D plot(X[,2], log(fdr1$priorprob/{1-fdr1$priorprob}), ylab='Logit of prior probability')
##D 
##D # Local FDR
##D plot(z, fdr1$localfdr, ylab='Local false-discovery rate')
##D 
##D # Extract findings at level FDR = Q
##D myfindings = which(fdr1$FDR <= Q)
## End(Not run)




