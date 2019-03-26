library(MXM)


### Name: Many simple beta regressions
### Title: Many simple beta regressions.
### Aliases: beta.regs perm.betaregs wald.betaregs
### Keywords: Regression models beta distribution

### ** Examples

y <- rbeta(60, 5, 3)
x <- matrix( rnorm(60 * 10), ncol = 10)
a1 <- beta.regs(y, x)
a2 <- perm.betaregs(y, x[, 1:5])



