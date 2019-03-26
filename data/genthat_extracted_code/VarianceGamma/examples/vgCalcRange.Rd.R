library(VarianceGamma)


### Name: vgCalcRange
### Title: Range of a Variance Gamma Distribution
### Aliases: vgCalcRange

### ** Examples


## Use the following rules for vgCalcRange when plotting graphs for dvg,
## ddvg and pvg.
## if nu < 2, use:
##   maxDens <- dvg(vgMode(param = c(vgC, sigma, theta, nu)),
##   param = c(vgC, sigma, theta, nu), log = FALSE)
##   vgRange <- vgCalcRange(param = c(vgC, sigma, theta, nu),
##     tol = 10^(-2)*maxDens, density = TRUE)

## if nu >= 2 and theta < 0, use:
##   vgRange <- c(vgC-2,vgC+6)
## if nu >= 2 and theta > 0, use:
##   vgRange <- c(vgC-6,vgC+2)
## if nu >= 2 and theta = 0, use:
##   vgRange <- c(vgC-4,vgC+4)

param <- c(0,0.5,0,0.5)
maxDens <- dvg(vgMode(param = param), param = param)
vgRange <- vgCalcRange(param = param, tol = 10^(-2)*maxDens)
vgRange
curve(dvg(x, param = param), vgRange[1], vgRange[2])
curve(dvg(x, param = param), vgRange[1], vgRange[2])

param <- c(2,2,0,3)
vgRange <- c(2-4,2+4)
vgRange
curve(dvg(x, param = param), vgRange[1], vgRange[2])
## Not run: vgCalcRange(param = param, tol = 10^(-3), density = FALSE)



