library(ProFit)


### Name: profitAddMats
### Title: Add together image matrices
### Aliases: profitAddMats
### Keywords: matrix add

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

# We can add a PSF to an image of two Sersic profiles:

magimage(profitAddMats(matbase=profitMakeModel(model, dim=c(200,200))$z,
matadd=profitMakePointSource(), addloc=c(50,150)))



