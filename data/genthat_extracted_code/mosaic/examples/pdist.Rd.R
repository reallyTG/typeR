library(mosaic)


### Name: pdist
### Title: Illustrated probability calculations from distributions
### Aliases: pdist xpgamma xpt xpchisq xpf xpbinom xppois xpgeom xpnbinom
###   xpbeta

### ** Examples

pdist("norm", -2:2)
pdist("norm", seq(80,120, by = 10), mean = 100, sd = 10)
pdist("chisq", 2:4, df = 3)
pdist("f", 1, df1 = 2, df2 = 10)
pdist("gamma", 2, shape = 3, rate = 4)



