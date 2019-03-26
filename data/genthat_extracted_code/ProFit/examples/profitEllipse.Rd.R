library(ProFit)


### Name: profitEllipse
### Title: Measure Isophotal Flux for Pseudo-Ellipses
### Aliases: profitEllipse
### Keywords: ellipse

### ** Examples


#The rough best fit model for G266033 (KiDS)

model=list(
  sersic=list(
    xcen = c(65.60642, 65.60642),
    ycen = c(78.6091, 78.6091),
    mag = c(18.49816, 16.97754),
    re = c(1.69112, 14.75940),
    nser = c(1.053961, 1),
    ang = c(39.53360, 35.02479),
    axrat = c(1, 0.5990869),
    box = c(0,0)
  )
)

data('ExampleInit')
image = readFITS(system.file("extdata", 'KiDS/G266033fitim.fits',package="ProFit"))$imDat

temp=profitEllipse(x=image, xcen=model$sersic$xcen[2], ycen=model$sersic$ycen[2], ang=
  model$sersic$ang[2], axrat=model$sersic$axrat[2], box=model$sersic$box[2])

#A rough deprojected ellipse plot:

magplot(temp, type='l', log='y', xlim=c(0,50), ylim=c(1e-12,2e-9), xlab='Pixels',
 ylab='Pixel Flux')

#Notice in the example that the core looks noisier, this is because we are deprojecting
#the bulge using the disk parameters. We can do the same using the bulge:

temp2=profitEllipse(x=image, xcen=model$sersic$xcen[1], ycen=model$sersic$ycen[1], ang=
  model$sersic$ang[1], axrat=model$sersic$axrat[1], box=model$sersic$box[1])
  
magplot(temp2, type='l', log='y', xlim=c(0,50), ylim=c(1e-12,2e-9), xlab='Pixels',
 ylab='Pixel Flux')

#The inner region (<5 pixels) is better deprojected using the bulge parameters.

#There is no simple way to meaningfully deproject such systems, sincew there will always
#be regions that are an even mix of bulge and disk flux, and these require different
#deprojection parameters. This is even true with IRAF Ellipse style ring fitting. The
#collapsing of data in this manner is an inherently lossy process!



