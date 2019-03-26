library(GroupTest)


### Name: GT.wrapper
### Title: Multiple testing procedure for the grouped hypothesis
### Aliases: GT.wrapper
### Keywords: Wrapper

### ** Examples

data(GroupTest_simulate)

GT.Test <- GT.wrapper( GroupTest_simulate, alpha=0.05, eta=alpha,
pi1.ini=0.7, pi2.1.ini=0.4, L=2, muL.ini=c(-1,1), sigmaL.ini=c(1,2),
cL.ini=c(0.4,0.6), DELTA=0.001, sigma.KNOWN=FALSE )




