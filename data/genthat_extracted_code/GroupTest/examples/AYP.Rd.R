library(GroupTest)


### Name: AYP
### Title: AYP of California, 2013
### Aliases: AYP
### Keywords: AYP

### ** Examples

data(AYP)

AYP.result <- GT.wrapper( AYP, alpha=0.1, eta=alpha, pi1.ini=0.5,
pi2.1.ini=0.05, L=2, muL.ini=c(3,-2), sigmaL.ini=c(1,1),
cL.ini=c(0.5,0.5), DELTA=0.0001, sigma.KNOWN=TRUE )



