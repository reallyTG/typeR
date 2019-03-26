library(altmeta)


### Name: plot.metaoutliers
### Title: Standardized Residual Plot for Outliers Diagnostics
### Aliases: plot.metaoutliers

### ** Examples

data("aex")
attach(aex)
out.aex <- metaoutliers(y, s2, model = "FE")
detach(aex)
plot(out.aex)

data("hipfrac")
attach(hipfrac)
out.hipfrac <- metaoutliers(y, s2, model = "RE")
detach(hipfrac)
plot(out.hipfrac)



