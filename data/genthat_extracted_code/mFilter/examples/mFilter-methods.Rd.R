library(mFilter)


### Name: mFilter-methods
### Title: Methods for mFilter objects
### Aliases: mFilter-methods residuals.mFilter fitted.mFilter print.mFilter
###   plot.mFilter summary.mFilter
### Keywords: ts smooth loess nonparametric

### ** Examples

## library(mFilter)

data(unemp)

opar <- par(no.readonly=TRUE)

unemp.hp <- mFilter(unemp,filter="HP")  # Hodrick-Prescott filter
print(unemp.hp)
summary(unemp.hp)
residuals(unemp.hp)
fitted(unemp.hp)
plot(unemp.hp)

par(opar)



