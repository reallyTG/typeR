library(lagsarlmtree)


### Name: lagsarlmtree
### Title: Spatial Lag Model Trees
### Aliases: lagsarlmtree print.lagsarlmtree plot.lagsarlmtree
###   coef.lagsarlmtree logLik.lagsarlmtree predict.lagsarlmtree
###   sctest.lagsarlmtree
### Keywords: tree

### ** Examples

## data and spatial weights
data("GrowthNUTS2", package = "lagsarlmtree")
data("WeightsNUTS2", package = "lagsarlmtree")

## spatial lag model tree
tr <- lagsarlmtree(ggdpcap ~ gdpcap0 + shgfcf + shsh + shsm |
    gdpcap0 + accessrail + accessroad + capital + regboarder + regcoast + regobj1 + cee + piigs,
  data = GrowthNUTS2, listw = WeightsNUTS2$invw,
  minsize = 12, alpha = 0.05)
print(tr)
plot(tr, tp_args = list(which = 1))

## query coefficients
coef(tr, model = "tree")
coef(tr, model = "rho")
coef(tr, model = "all")



