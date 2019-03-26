library(ProFit)


### Name: profitMakePointSource
### Title: Create an image of a point source (PS) with an analytical or
###   empirical point spread function (PSF).
### Aliases: profitMakePointSource
### Keywords: PSF

### ** Examples

# Create a PSF with a suitable width:
profitMakePointSource(plot=TRUE)
  
# We can create a point source in a larger image:
psf = profitMakePointSource(xcen=100,ycen=50,mag=15,modellist=list(
  sersic=list(re=2,nser=0.5,mag=0,axrat=0.2, ang=0.5)),
  magzero=0,image=matrix(0,200,200), finesample=1L)
magimage(psf)

# Note that Gaussian PSFs are very accurate but subject to roundoff errors below ~1e-30. 
# Try rotating an elliptical PSF:
angles = seq(0,180,by=90/4)
par(mfrow=c(3,3))
for(ang in angles) {
  psf = round(profitMakePointSource(mag=0,modellist=list(
    sersic=list(re=2,nser=0.5,mag=0,axrat=0.5,ang=ang)), 
    image=matrix(0,15,15)),20)
  print(max(psf))
  magimage(psf)
}
par(mfrow=c(1,1))

# Now interpolate the last empirical PSF (less accurate than creating it from scratch):

profitMakePointSource(xcen=7,ycen=7,mag=0,psf=psf,image=image,modellist=NULL, plot=TRUE)




