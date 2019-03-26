library(tawny)


### Name: divergence
### Title: Measure the divergence and stability between two correlation
###   matrices
### Aliases: divergence divergence.stability divergence.kl divergence_lim
###   stability_lim plotDivergenceLimit.kl KullbackLeibler
### Keywords: ts

### ** Examples

data(sp500.subset)
h <- sp500.subset

divergence(h, 25, filter=function(x) denoise(x, RandomMatrixDenoiser()))
divergence(h, 25, filter=function(x) denoise(x, ShrinkageDenoiser()))

## Not run: 
##D plotDivergenceLimit.kl(100, 80:499, col='green', ylim=c(0,55))
## End(Not run)




