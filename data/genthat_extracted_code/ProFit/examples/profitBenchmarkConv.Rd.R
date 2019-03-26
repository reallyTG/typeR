library(ProFit)


### Name: profitBenchmarkConv
### Title: Benchmark convolution of an image with a point spread function
###   (PSF).
### Aliases: profitBenchmarkConv
### Keywords: data

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
##D model.image=profitMakeModel(model=model, dim=c(200,200))$z
##D 
##D psf=profitMakeGaussianPSF()
##D 
##D #Do some benchmarking:
##D 
##D temp=profitBenchmarkConv(model.image, psf=psf, nbench=1)
##D 
##D #Check the best:
##D 
##D temp$best
##D 
##D #And we can use all three:
##D 
##D magimage(profitConvolvePSF(model.image, psf, options=list(method='Bruteconv')))
##D magimage(profitConvolvePSF(model.image, psf, options=list(method='FFTconv', fft=temp$fft)))
##D magimage(profitConvolvePSF(model.image, psf, options=list(method='FFTWconv', fft=temp$fft)))
##D 
##D #Some benchmarking for different size PSFs:
##D 
##D profitBenchmarkConv(imagedim=c(200,200), psfdim=c(11,11), nbench=1)
##D profitBenchmarkConv(imagedim=c(200,200), psfdim=c(21,21), nbench=1)
##D profitBenchmarkConv(imagedim=c(200,200), psfdim=c(31,31), nbench=1)
##D 
##D #Note they are all very similar in speed when psfdim=21. The time for FFT and FFTW
##D #pretty much scales with the number of pixels in the image (regardless of PSF).
##D 
##D #Because of how they scale, there are some rough rules-of-thumb you can use:
##D 
##D #Brute force is usually faster when psfdim<=21:
##D 
##D profitBenchmarkConv(imagedim=c(200,200), psfdim=c(15,15), nbench=1)
##D 
##D #FFT is usually faster when imagedim<400 & psfdim>21 & psfdim<100:
##D 
##D profitBenchmarkConv(imagedim=c(200,200), psfdim=c(51,51), nbench=1)
##D 
##D #FFTW is usually faster when imagedim>400 & psfdim>21
##D 
##D profitBenchmarkConv(imagedim=c(400,400), psfdim=c(25,25), nbench=1)
## End(Not run)



