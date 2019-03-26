library(ProFit)


### Name: profitBenchmarkResultStripPointers
### Title: Return a copy of a data.frame with pointers converted to strings
###   for easy printing
### Aliases: profitBenchmarkResultStripPointers
### Keywords: data

### ** Examples

## Not run: 
##D   openclenvs = profitGetOpenCLEnvs(make.envs=TRUE)
##D   print(profitBenchmarkResultStripPointers(openclenvs))
##D   img = profitMakeGaussianPSF()
##D   bench=profitBenchmark(img, psf=img, nbench=1L, methods=profitAvailableConvolvers())
##D   print(profitBenchmarkResultStripPointers(bench$result)[
##D     c("name","env_name","version","dev_name",paste0("tinms.mean_",c("single","double")))])
## End(Not run)



