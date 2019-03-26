library(plotfunctions)


### Name: legend_margin
### Title: Add legend with respect to figure instead of plot region.
###   Allows to move legend to margin of plot.
### Aliases: legend_margin

### ** Examples

plot(cars$speed, cars$dist, pch=16)
legend_margin("topleft", legend=c("points"), pch=16)
# compare with default legend:
legend("topleft", legend=c("points"), pch=16)



