library(MXM)


### Name: Univariate regression based tests
### Title: Univariate regression based tests
### Aliases: univregs ebic.univregs perm.univregs wald.univregs
###   score.univregs big.score.univregs rint.regs glmm.univregs
###   gee.univregs
### Keywords: Regression models

### ** Examples

y <- rpois(50, 15)
x <- matrix( rnorm(50 * 10), ncol = 10)
a1 <- univregs(y, x, test = testIndPois)
a2 <- perm.univregs(y, x, test = permPois)
a3 <- wald.univregs(y, x, test = waldPois)



