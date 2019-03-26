library(ggfortify)


### Name: autoplot.basis
### Title: Autoplot spline basis instances
### Aliases: autoplot.basis

### ** Examples

library(splines)
x <- seq(0, 1, by=0.001)
spl <- bs(x, df=6)
autoplot(spl)
autoplot(spl, n=5)



