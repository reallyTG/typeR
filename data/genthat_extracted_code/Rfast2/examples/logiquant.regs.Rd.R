library(Rfast2)


### Name: Many simple quantile regressions using logistic regressions
### Title: Many simple quantile regressions using logistic regressions.
### Aliases: logiquant.regs

### ** Examples

y <- rcauchy(100, 3, 2)
x <- matrix( rnorm(100 * 50), ncol = 50 )
a <- logiquant.regs(y, x)



