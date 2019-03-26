library(altmeta)


### Name: metaoutliers
### Title: Outlier Detection in Meta-Analysis
### Aliases: metaoutliers

### ** Examples

data("aex")
attach(aex)
metaoutliers(y, s2, model = "FE")
metaoutliers(y, s2, model = "RE")
detach(aex)

data("hipfrac")
attach(hipfrac)
metaoutliers(y, s2)
detach(hipfrac)



