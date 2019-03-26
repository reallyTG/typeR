library(forward)


### Name: plot.fwdlm
### Title: Forward Search in Linear Regression
### Aliases: plot.fwdlm
### Keywords: robust regression models

### ** Examples

library(MASS)
data(forbes)
plot(forbes)
mod <- fwdlm(100*log10(pres) ~ bp, data=forbes)
summary(mod)
## Not run: plot(mod)



