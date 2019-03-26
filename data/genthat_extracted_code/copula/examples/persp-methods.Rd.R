library(copula)


### Name: persp-methods
### Title: Methods for Function 'persp' in Package 'copula'
### Aliases: persp-methods persp,Copula-method persp,mvdc-method
### Keywords: methods hplot

### ** Examples

persp(claytonCopula(2),   pCopula, main = "CDF of claytonCopula(2)")
persp(  frankCopula(1.5), dCopula, main = "Density of frankCopula(1.5)")
persp(  frankCopula(1.5), dCopula, main = "c_[frank(1.5)](.)", zlim = c(0,2))

## Examples with negative tau:
(th1 <- iTau(amhCopula(), -0.1))
persp(amhCopula(th1), dCopula)
persp(amhCopula(th1), pCopula, ticktype = "simple") # no axis ticks
persp(  frankCopula(iTau(  frankCopula(), -0.1)), dCopula)
persp(claytonCopula(iTau(claytonCopula(), -0.1)), dCopula)
##
cCop.2 <- function(u, copula, ...) cCopula(u, copula, ...)[,2]
persp(    amhCopula(iTau(    amhCopula(), -0.1)), cCop.2, main="cCop(AMH...)[,2]")
persp(  frankCopula(iTau(  frankCopula(), -0.1)), cCop.2, main="cCop(frankC)[,2]")
## and  Clayton  also looks "the same" ...

## MVDC Examples ------------------------------------
mvNN <- mvdc(gumbelCopula(3), c("norm", "norm"),
          list(list(mean = 0, sd = 1), list(mean = 1)))
persp(mvNN, dMvdc, xlim=c(-2, 2), ylim=c(-1, 3), main = "Density")
persp(mvNN, pMvdc, xlim=c(-2, 2), ylim=c(-1, 3), main = "Cumulative Distr.")



