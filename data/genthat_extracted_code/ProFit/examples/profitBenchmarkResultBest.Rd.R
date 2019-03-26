library(ProFit)


### Name: profitBenchmarkResultBest
### Title: Return best integration/convolution method from a
###   profitBenchmark result.
### Aliases: profitBenchmarkResultBest
### Keywords: data

### ** Examples

## Not run: 
##D img = profitMakeGaussianPSF()
##D bench=profitBenchmark(img, psf=img, nbench=1L, methods=profitAvailableConvolvers())
##D print(profitBenchmarkResultStripPointers(bench$result)[
##D   c("name","env_name","version","dev_name",paste0("tinms.mean_",c("single","double")))])
##D best = profitBenchmarkResultBest(bench$result)
##D print(paste('Name:',best$name,'time:',best$time))
## End(Not run)



