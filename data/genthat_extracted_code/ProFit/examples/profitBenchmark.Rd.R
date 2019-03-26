library(ProFit)


### Name: profitBenchmark
### Title: Benchmark profile integration and image convolution using
###   libprofit.
### Aliases: profitBenchmark
### Keywords: benchmark, profit

### ** Examples

## Not run: 
##D model = list(
##D 	sersic = list(
##D 		xcen   = c(180, 60),
##D 		ycen   = c(90, 10),
##D 		mag = c(15, 13),
##D 		re  = c(14, 5),
##D 		nser  = c(3, 10),
##D 		ang  = c(46, 80),
##D 		axrat  = c(0.4, 0.6),
##D 		box = c(0.5,-0.5)
##D 	)
##D )
##D 
##D psffwhm=3
##D 
##D # Use OpenCL if available
##D # Makes a list of available OpenCL environments optionally with double precision if all
##D # devices support it
##D 
##D openclenvs = profitGetOpenCLEnvs(make.envs=TRUE)
##D nbench=1L
##D 
##D # Try up to 5L if you're adventurous and don't mind waiting up to a minute for
##D # single-threaded brute
##D 
##D for(finesample in c(1L:3L))
##D {
##D   model.image=profitMakeModel(model=model, dim=rep(200,2), finesample=finesample, returnfine=TRUE)$z
##D   psf=profitMakeGaussianPSF(fwhm=3*finesample,dim=rep(25*finesample + 1 - mod(finesample,2),2))
##D   
##D   # Benchmark model integration:
##D   bench=profitBenchmark(model.image, modellist=model, nbench=nbench, openclenvs=openclenvs,
##D     methods=profitAvailableIntegrators())
##D 
##D   #Print relevant results
##D   print(profitBenchmarkResultStripPointers(bench$result)[
##D     c("name","env_name","version","dev_name",paste0("tinms.mean_",c("single","double")))])
##D   
##D   # Benchmark convolution:
##D   bench=profitBenchmark(model.image, psf=psf, nbench=nbench, openclenvs=openclenvs,
##D     methods=profitAvailableConvolvers())
##D   
##D   #Print relevant results
##D   print(profitBenchmarkResultStripPointers(bench$result)[
##D     c("name","env_name","version","dev_name",paste0("tinms.mean_",c("single","double")))])
##D 
##D   # The old benchmarking method, for reference
##D   temp=profitBenchmarkConv(model.image, psf = psf, nbench=nbench)
##D }
## End(Not run)



