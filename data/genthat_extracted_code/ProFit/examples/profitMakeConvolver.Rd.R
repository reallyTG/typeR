library(ProFit)


### Name: profitMakeConvolver
### Title: Creates a Convolver object.
### Aliases: profitMakeConvolver
### Keywords: PSF convolve convolution

### ** Examples

## Not run: 
##D psf = profitMakeGaussianPSF(dim=c(100,100))
##D 
##D has_openCL=profitHasOpenCL()
##D has_fft = profitHasFFTW()
##D has_openMP=profitHasOpenMP()
##D 
##D convolver_brute = profitMakeConvolver("brute", c(400, 400), psf)
##D 
##D if(has_openCL){
##D   convolver_bruteCL = profitMakeConvolver("opencl", c(400, 400), psf,
##D   openclenv=profitOpenCLEnv())
##D }
##D 
##D if(has_fft){
##D 	convolver_fft = profitMakeConvolver("fft", c(400, 400), psf, fft_effort=1,
##D 	omp_threads=1)
##D }
##D 
##D if(has_fft & has_openMP){
##D 	convolver_fftMP = profitMakeConvolver("fft", c(400, 400), psf, fft_effort=1,
##D 	omp_threads=4)
##D }
##D 
##D model = list(
##D   sersic = list(
##D     xcen   = c(80, 210),
##D     ycen   = c(190, 50),
##D     mag = c(15, 13),
##D     re  = c(14, 5),
##D     nser  = c(3, 10),
##D     ang  = c(46, 80),
##D     axrat  = c(0.4, 0.6),
##D     box = c(0.5,-0.5)
##D   )
##D )
##D 
##D system.time(for(i in 1:10){image_brute=profitMakeModel(model=model, dim=c(300,300), psf=psf,
##D   convopt=list(convolver=convolver_brute))$z})
##D 
##D if(has_openCL){
##D system.time(for(i in 1:10){image_bruteCL=profitMakeModel(model=model, dim=c(300,300), psf=psf,
##D   convopt=list(convolver=convolver_bruteCL))$z})
##D }
##D 
##D if(has_fft){
##D system.time(for(i in 1:10){image_fft=profitMakeModel(model=model, dim=c(300,300), psf=psf,
##D   convopt=list(convolver=convolver_fft))$z})
##D }
##D 
##D if(has_fft & has_openMP){
##D system.time(for(i in 1:10){image_fftMP=profitMakeModel(model=model, dim=c(300,300), psf=psf,
##D   convopt=list(convolver=convolver_fftMP))$z})
##D }
##D 
##D magimage(image_brute)
##D 
##D if(has_openCL){
##D   magimage(image_bruteCL)
##D   magimage(image_brute-image_bruteCL)
##D }
##D 
##D if(has_fft){
##D   magimage(image_fft)
##D   magimage(image_brute-image_fft)
##D }
##D 
##D if(has_fft & has_openMP){
##D   magimage(image_fftMP)
##D   magimage(image_brute-image_fftMP)
##D }
## End(Not run)



