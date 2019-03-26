library(ProFit)


### Name: profitBruteConv
### Title: Low level brute force image convolution
### Aliases: profitBruteConv
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

# Without convolution:

magimage(model.image)

# With convolution:

magimage(profitBruteConv(image=model.image, psf=profitMakePointSource()))



