library(FDRSeg)


### Name: simulQuantile
### Title: Quantile simulations
### Aliases: simulQuantile
### Keywords: nonparametric

### ** Examples

library(stepR)

# simulate quantiles for independent Gaussian noises
qs  <- simulQuantile(0.9, 100, type = "smuce")
qfs <- simulQuantile(0.9, 100, type = "fdrseg")
# plot result
yrng <- range(qs, qfs)
plot(qfs, pch = 20, ylim = yrng, xlab = "n", ylab = "")
abline(h = qs)

# simulate  quantiles for dependent Gaussian noises
convKern <- dfilter("bessel")$kern  # create digital filters
qdfs     <- simulQuantile(0.9, 100, type = "dfdrseg", convKern = convKern)
plot(qdfs, pch = 20, xlab = "n", ylab = "")



