library(ProFound)


### Name: profoundGetEllipsesPlot
### Title: Create diagnostic plot of estimated iso-photal ellipses
### Aliases: profoundGetEllipsesPlot
### Keywords: ellipse

### ** Examples

## Not run: 
##D # We need the ProFit library to show the profile: library(ProFit)
##D image = readFITS(system.file("extdata", 'KiDS/G266035fitim.fits', package="ProFit"))$imDat
##D segim = readFITS(system.file("extdata", 'KiDS/G266035segim.fits', package="ProFit"))$imDat
##D ellipses = profoundGetEllipses(image=image, segim=segim, segID=4, plot=FALSE)
##D 
##D #We can get a good overall idea of how good the ellipses are by running with defaults:
##D profoundGetEllipsesPlot(image=image, ellipses=ellipses$ellipses)
##D 
##D #We can check a specific ellipse too:
##D profoundGetEllipsesPlot(image=ellipses$segellipses==8, ellipses=ellipses$ellipses,
##D segellipseID=8, col=grey(0:1), border='red', lwd=2)
## End(Not run)



