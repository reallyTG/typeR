library(SkewHyperbolic)


### Name: skewhypMeanVarMode
### Title: Moments and Mode of the Skew Hyperbolic Student t-Distribution.
### Aliases: skewhypMeanVarMode skewhypMean skewhypVar skewhypSkew
###   skewhypKurt skewhypMode
### Keywords: distribution

### ** Examples

param <- c(10,1,5,9)
skewhypMean(param = param)
skewhypVar(param = param)
skewhypSkew(param = param)
skewhypKurt(param = param)
skewhypMode(param = param)
range <- skewhypCalcRange(param = param)
curve(dskewhyp(x, param = param), range[1], range[2])
abline(v = skewhypMode(param = param), col = "red")
abline(v = skewhypMean(param = param), col = "blue")



