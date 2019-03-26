library(VarianceGamma)


### Name: Variance Gamma Mean, Variance, Skewness, Kurtosis and Mode
### Title: Moments and Mode of the Variance Gamma Distribution
### Aliases: vgMean vgVar vgSkew vgKurt vgMode

### ** Examples

param <- c(2,2,2,0.5)
vgMean(param = param)
## Or to specify parameter values individually, use:
vgMean (2,2,2,0.5)
  
vgVar(param = param)
vgSkew(param = param)
vgKurt(param = param)
vgMode(param = param)
maxDens <- dvg(vgMode(param = param), param = param)
vgRange <- vgCalcRange(param = param, tol = 10^(-2)*maxDens)
curve(dvg(x, param = param), vgRange[1], vgRange[2])
abline(v = vgMode(param = param), col = "blue")
abline(v = vgMean(param = param), col = "red")



