library(ProFound)


### Name: profoundDrawEllipse
### Title: Draw Ellipse
### Aliases: profoundDrawEllipse
### Keywords: ellipse

### ** Examples

## Not run: 
##D image=readFITS(system.file("extdata", 'VIKING/mystery_VIKING_Z.fits', package="ProFound"))
##D 
##D profound=profoundProFound(image, magzero=30, verbose=TRUE, plot=TRUE)
##D profoundDrawEllipse(profound$segstats$xcen, profound$segstats$ycen,
##D profound$segstats$R100/0.339, profound$segstats$axrat, profound$segstats$ang,
##D col='white', lty=2)
## End(Not run)



