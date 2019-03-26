library(pRSR)


### Name: plotrsr
### Title: Plot of response surface regression for different quantile
### Aliases: plotrsr
### Keywords: ts

### ** Examples

# Plot for 75%, 90% and 95% quantiles.
plotrsr(n=10:50, q=c(75,90,95))
# Plot for 80%, 90%, 95% and 99% quantiles.
# We use color red and dashed line
plotrsr(n=10:50, q=c(80,90,95, 99), col=2, lty=3)



