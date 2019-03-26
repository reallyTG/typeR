library(copula)


### Name: setTheta
### Title: Specify the Parameter(s) of a Copula
### Aliases: setTheta setTheta,acopula,ANY-method
###   setTheta,copula,ANY-method setTheta,xcopula,ANY-method
###   setTheta,outer_nacopula,numeric-method
###   setTheta,ellipCopula,ANY-method setTheta,khoudrajiCopula,ANY-method
###   setTheta,mixCopula,ANY-method
### Keywords: manip

### ** Examples

myC <- setTheta(copClayton, 0.5)
myC
## Frank copula with Kendall's tau = 0.8 :
(myF.8 <- setTheta(copFrank, iTau(copFrank, tau = 0.8)))

# negative theta is ok for dim = 2 :
myF <- setTheta(copFrank, -2.5, noCheck=TRUE)
myF@tau(myF@theta) # -0.262

myT <- setTheta(tCopula(df.fixed=TRUE), 0.7)
stopifnot(all.equal(myT, tCopula(0.7, df.fixed=TRUE), tolerance=0))

(myT2 <- setTheta(tCopula(dim=3, df.fixed=TRUE), 0.7))
## Setting 'rho' and 'df'  --- for default df.fixed=FALSE :
(myT3 <- setTheta(tCopula(dim=3), c(0.7, 4)))



