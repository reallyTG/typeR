library(MXM)


### Name: Many simple zero inflated Poisson regressions
### Title: Many simple zero inflated Poisson regressions.
### Aliases: zip.regs perm.zipregs wald.zipregs
### Keywords: Regression models zero inflated Poisson

### ** Examples

y <- rpois(50, 3)
x <- matrix( rnorm(50 * 10), ncol = 10)
y[1:10] <- 0
a1 <- zip.regs(y, x)
a2 <- perm.zipregs(y, x[, 1:3])



