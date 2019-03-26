library(GroupTest)


### Name: GT.em
### Title: EM Algorithm
### Aliases: GT.em
### Keywords: AEM Algorithm

### ** Examples

data(GroupTest_simulate)
em.estimate <- GT.em( GroupTest_simulate, L=2, pi1.ini=0.7, pi2.1.ini=0.4,
muL.ini=c(-1,1), sigmaL.ini=c(1,2), cL.ini=c(0.4,0.6), DELTA=0.001,
sigma.KNOWN=FALSE )



