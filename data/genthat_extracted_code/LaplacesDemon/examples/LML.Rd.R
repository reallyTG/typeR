library(LaplacesDemon)


### Name: LML
### Title: Logarithm of the Marginal Likelihood
### Aliases: LML
### Keywords: Harmonic Mean Estimator Integrated Likelihood
###   Laplace-Metropolis Estimator Marginal Likelihood Nonparametric
###   Self-Normalized Importance Sampling Prior Predictive Distribution

### ** Examples

### If a model object were created and called Fit, then:
#
### Applying HME to an object of class demonoid or pmc:
#LML(LL=Fit$Deviance*(-1/2), method="HME")
#
### Applying LME to an object of class demonoid:
#LML(Model, MyData, Modes=apply(Fit$Posterior1, 2, median), method="LME")
#
### Applying NSIS to an object of class demonoid
#LML(theta=Fit$Posterior1, LL=Fit$Deviance*-(1/2), method="NSIS")
#
### Applying LME to an object of class iterquad:
#LML(Model, MyData, Modes=Fit$Summary1[,1], method="LME")
#
### Applying LME to an object of class laplace:
#LML(Model, MyData, Modes=Fit$Summary1[,1], method="LME")
#
### Applying LME to an object of class vb:
#LML(Model, MyData, Modes=Fit$Summary1[,1], method="LME")



