library(psd)


### Name: tapers-methods
### Title: Generic methods for objects with class "tapers"
### Aliases: as.data.frame.tapers data.frame.tapers lines.tapers
###   plot.tapers points.tapers print.summary.tapers print.tapers
###   summary.tapers tapers-methods

### ** Examples

##
tap <- as.tapers(c(1:49,50:0)+rnorm(1e2))
print(tap)
print(summary(tap))
plot(tap)
# no arithmetic methods
tap <- as.tapers(tap/2)
lines(tap)



