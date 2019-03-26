library(forward)


### Name: fwdlm
### Title: Forward Search in Linear Regression
### Aliases: fwdlm print.fwdlm
### Keywords: robust regression models

### ** Examples

library(MASS)
data(forbes)
plot(forbes, xlab="Boiling point", ylab="Pressure)")
mod <- fwdlm(100*log10(pres) ~ bp, data=forbes)
summary(mod)
## Not run: plot(mod)
plot(mod, 1)
plot(mod, 6, ylim=c(-3, 1000))



