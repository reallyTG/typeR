library(ProFit)


### Name: profitInterp2d
### Title: 2D image interpolation
### Aliases: profitInterp2d
### Keywords: interpolate interpolation

### ** Examples

PSFeven=profitMakePointSource(image = matrix(0,24,24))
magimage(PSFeven)
xrange=floor(-dim(PSFeven)[1]/2):ceiling(dim(PSFeven)[1]/2)
yrange=floor(-dim(PSFeven)[2]/2):ceiling(dim(PSFeven)[2]/2)
regrid=expand.grid(xrange,yrange)
PSFodd=matrix(profitInterp2d(x=regrid[,1], y=regrid[,2], image=PSFeven)[,3],
length(xrange),length(yrange))
magimage(PSFodd)



