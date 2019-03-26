library(iDINGO)


### Name: extendedBIC
### Title: Extended bayesian information criteria for gaussian graphical
###   models
### Aliases: extendedBIC

### ** Examples

library(glasso)
data(gbm)
x = gbm[,1]
Y = gbm[,-1]

# Estimating inverse covariance matrix using GLasso #
S = cov(Y)

rhoarray = exp(seq(log(0.001),log(1),length=100))
BIC = rep(0,length(rhoarray))
for (rh in 1:length(rhoarray)) {
    fit.gl1 = glasso(S,rho=rhoarray[rh])
    BIC[rh] = extendedBIC(gamma=0,omegahat=fit.gl1$wi,S=S,n=nrow(Y))
}
rho = rhoarray[which.min(BIC)]
fit.gl2 = glasso(S,rho=rho)
Omega = fit.gl2$wi





