library(Rfast2)


### Name: BIC of many simple univariate regressions
### Title: BIC of many simple univariate regressions.
### Aliases: bic.regs

### ** Examples

y <- rbinom(100, 1, 0.6)
x <- matrix( rnorm(100 * 50), ncol = 50 )
bic.regs(y, x, "binomial")



