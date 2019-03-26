library(GroupTest)


### Name: GroupTest_simulate
### Title: Simulated data set to demonstrate the package
### Aliases: GroupTest_simulate
### Keywords: Simulate Data

### ** Examples

data(GroupTest_simulate)

GT.test <- GT.wrapper( GroupTest_simulate, alpha=0.05, eta=alpha,
pi1.ini=0.7, pi2.1.ini=0.4, L=2, muL.ini=c(-1,1), sigmaL.ini=c(1,2),
cL.ini=c(0.4,0.6), DELTA=0.001, sigma.KNOWN=FALSE )




