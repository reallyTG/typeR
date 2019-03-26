library(tis)


### Name: convert
### Title: Time scale conversions for time series
### Aliases: convert
### Keywords: ts

### ** Examples

wSeries <- tis(1:105, start = ti(19950107, tif = "wsaturday"))
observed(wSeries) <- "ending"   ## end of week values
mDiscrete <- convert(wSeries, "monthly", method = "discrete")
mConstant <- convert(wSeries, "monthly", method = "constant")
mLinear   <- convert(wSeries, "monthly", method = "linear")
mCubic    <- convert(wSeries, "monthly", method = "cubic")

## linear and cubic are identical because wSeries is a pure linear trend
cbind(mDiscrete, mConstant, mLinear, mCubic)

observed(wSeries) <- "averaged"   ## weekly averages
mDiscrete <- convert(wSeries, "monthly", method = "discrete")
mConstant <- convert(wSeries, "monthly", method = "constant")
mLinear   <- convert(wSeries, "monthly", method = "linear")

cbind(mDiscrete, mConstant, mLinear)



