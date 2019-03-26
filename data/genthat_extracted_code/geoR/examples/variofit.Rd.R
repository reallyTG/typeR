library(geoR)


### Name: variofit
### Title: Variogram Based Parameter Estimation
### Aliases: variofit .loss.vario
### Keywords: spatial

### ** Examples

vario100 <- variog(s100, max.dist=1)
ini.vals <- expand.grid(seq(0,1,l=5), seq(0,1,l=5))
ols <- variofit(vario100, ini=ini.vals, fix.nug=TRUE, wei="equal")
summary(ols)
wls <- variofit(vario100, ini=ini.vals, fix.nug=TRUE)
summary(wls)
plot(vario100)
lines(wls)
lines(ols, lty=2)

## Don't show: 
vr <- variog(s100, max.dist=1)
## OLS#
o1 <- variofit(vr, ini = c(.5, .5), fix.nug=TRUE, wei = "equal")
o2 <- variofit(vr, ini = c(.5, .5), wei = "equal")
o3 <- variofit(vr, ini = c(.5, .5), fix.nug=TRUE,
      fix.kappa = FALSE, wei = "equal")
o4 <- variofit(vr, ini = c(.5, .5), fix.kappa = FALSE, wei = "equal")
## WLS
w1 <- variofit(vr, ini = c(.5, .5), fix.nug=TRUE)
w2 <- variofit(vr, ini = c(.5, .5))
w3 <- variofit(vr, ini = c(.5, .5), fix.nug=TRUE, fix.kappa = FALSE)
w4 <- variofit(vr, ini = c(.5, .5), fix.kappa = FALSE)
## End(Don't show)




