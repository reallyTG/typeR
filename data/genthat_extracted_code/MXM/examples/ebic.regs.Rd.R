library(MXM)


### Name: eBIC for many regression models
### Title: eBIC for many regression models
### Aliases: ebic.regs
### Keywords: Regression models

### ** Examples

y <- rpois(50, 15)
x <- matrix( rnorm(50 * 10), ncol = 10)
a1 <- univregs(y, x, test = testIndPois)
a2 <- perm.univregs(y, x, test = permPois)
a3 <- wald.univregs(y, x, test = waldPois)
a4 <- cond.regs(y, as.data.frame(x), xIndex = 1:4, csIndex = 5, test = testIndPois)



