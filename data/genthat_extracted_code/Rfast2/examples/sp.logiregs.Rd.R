library(Rfast2)


### Name: Many approximate simple logistic regressions
### Title: Many approximate simple logistic regressions.
### Aliases: sp.logiregs

### ** Examples

y <- rbinom(200, 1, 0.5)
x <- matrix( rnorm(200 * 50), ncol = 50 )
a <- sp.logiregs(y, x)



