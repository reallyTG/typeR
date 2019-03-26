library(copula)


### Name: fixParam
### Title: Fix a Subset of a Copula Parameter Vector
### Aliases: fixParam fixedParam<- fixedParam<-,copula,logical-method
###   fixedParam<-,khoudrajiCopula,logical-method
###   fixedParam<-,mixCopula,logical-method
###   fixedParam<-,rotCopula,logical-method isFree isFree,parCopula-method
###   isFree,copula-method isFree,khoudrajiCopula-method
###   isFree,mixCopula-method isFree,rotCopula-method isFreeP nParam
###   nParam,parCopula-method nParam,copula-method
###   nParam,khoudrajiCopula-method nParam,mixCopula-method
###   nParam,rotCopula-method
### Keywords: manip utilities

### ** Examples

nc1 <- normalCopula(dim = 3, fixParam(c(.6,.3,.2), c(TRUE, FALSE,FALSE)),
                    dispstr = "un")
nc1
nc13 <- nc12 <- nc1
fixedParam(nc12) <- c(TRUE, TRUE, FALSE) ; nc12
fixedParam(nc13) <- c(TRUE, FALSE, TRUE) ; nc13
set.seed(17); x <- rCopula(100, nc1)
summary(f.13 <- fitCopula(nc13, x, method = "ml"))
f.13@copula  # 'rho.2' is estimated; the others kept fixed

## Setting to 'FALSE' (removes the "fixed" parts completely):
nc0 <- nc13; fixedParam(nc0) <- FALSE
nc0
stopifnot(is.null(attributes(nc0@parameters)))



