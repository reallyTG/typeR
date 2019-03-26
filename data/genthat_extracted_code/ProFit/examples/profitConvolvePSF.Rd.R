library(ProFit)


### Name: profitConvolvePSF
### Title: High level image convolution
### Aliases: profitConvolvePSF
### Keywords: PSF convolve convolution

### ** Examples

model = list(
	sersic = list(
		xcen   = c(180, 60),
		ycen   = c(90, 10),
		mag = c(15, 13),
		re  = c(14, 5),
		nser  = c(3, 10),
		ang  = c(46, 80),
		axrat  = c(0.4, 0.6),
		box = c(0.5,-0.5)
	)
)

model.image=profitMakeModel(model=model, dim=c(200,200))$z

psf=profitMakeGaussianPSF()

#Do some benchmarking:

temp=profitBenchmarkConv(model.image, psf=psf)

#Check the best:

temp$best

#And we can use all three:

magimage(profitConvolvePSF(model.image, psf, options=list(method='Bruteconv')))
magimage(profitConvolvePSF(model.image, psf, options=list(method='FFTconv', fft=temp$fft)))
magimage(profitConvolvePSF(model.image, psf, options=list(method='FFTWconv', fft=temp$fft)))



