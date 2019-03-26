library(CUSUMdesign)


### Name: getH
### Title: compute decision interval (H) for CUSUM charts
### Aliases: getH
### Keywords: Decision interval CUSUM Quality control

### ** Examples

# normal mean
getH(distr=1, ICmean=10, ICsd=2, OOCmean=15, ARL=1000, type="F")

# normal variance
getH(distr=2, ICsd=2, OOCsd=4, samp.size=5, ARL=1000, type="F")

# Poission
getH(distr=3, ICmean=2, OOCmean=3, ARL=100, type="F")

# Binomial
getH(distr=4, ICprob=0.2, OOCprob=0.6, samp.size=100, ARL=1000, type="F")

# Negative binomial
getH(distr=5, ICmean=1, ICvar=3, OOCmean=2, ARL=100, type="F")

# Inverse Gaussian mean
getH(distr=6, ICmean=1, IClambda=0.5, OOCmean=2, ARL=1000, type="F")



