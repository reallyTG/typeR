library(MXM)


### Name: Generalised ordinal regression
### Title: Generalised ordinal regression
### Aliases: ordinal.reg
### Keywords: Regression model ordinal regression

### ** Examples

y <- factor( rbinom(100, 3, 0.5) )
x <- matrix( rnorm(100*3), ncol = 3)
ordinal.reg(y ~ x, data = data.frame(x) )
ordinal.reg(y ~ 1, data = data.frame(x) )



