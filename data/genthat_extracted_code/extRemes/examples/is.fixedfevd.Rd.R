library(extRemes)


### Name: is.fixedfevd
### Title: Stationary Fitted Model Check
### Aliases: is.fixedfevd check.constant
### Keywords: logic misc

### ** Examples

z <- revd(100, loc=20, scale=0.5, shape=-0.2)
fit <- fevd(z)
fit

is.fixedfevd(fit)




