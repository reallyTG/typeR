library(dae)


### Name: fac.divide
### Title: Divides a factor into several individual factors
### Aliases: fac.divide
### Keywords: factor manip

### ** Examples

## generate a small completely randomized design for 6 treatments 
n <- 12
CRD.unit <- list(Unit = n)
treat <- factor(rep(1:4, each = 3))
CRD.lay <- designRandomize(allocated = treat, recipient = CRD.unit, seed=956)

## divide the treatments into two two-level factor A nd B
CRD.facs <- fac.divide(CRD.lay$treat, factor.names = list(A = 2, B = 2))



