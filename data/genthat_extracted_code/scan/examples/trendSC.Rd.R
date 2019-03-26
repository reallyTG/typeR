library(scan)


### Name: trendSC
### Title: Trend analysis for single-cases data
### Aliases: trendSC

### ** Examples

## Compute the linear and squared regression for a random single-case
matthea <- rSC(d.slope = 0.5)
trendSC(matthea)

## Besides the linear and squared regression models compute two custom models:
## a) a cubic model, and b) the values predicted by the natural logarithm of the
## measurement time.
ben <- rSC(d.slope = 0.3)
trendSC(ben, B.offset = 0, model = c("Cubic" = "values ~ I(mt^3)", "Log Time" = "values ~ log(mt)"))



