library(magicaxis)


### Name: magimageWCS
### Title: Tan Gnomonic WCS Image Decoration
### Aliases: magimageWCS magimageWCSRGB magimageWCSGrid magimageWCSLabels
###   magimageWCSCompass
### Keywords: WCS gnomonic

### ** Examples

## Not run: 
##D image=readFITS(system.file("extdata", 'VIKING/mystery_VIKING_Z.fits', package="ProFit"))
##D 
##D #Convenient image plotting for lists containing headers:
##D 
##D magimageWCS(image$imDat, header=image$hdr)
##D magimageWCS(image)
##D 
##D #First using the outer margins for tick labels:
##D 
##D par(mar=c(3.1,3.1,1.1,1.1))
##D magimageWCS(image)
##D magimageWCS(image, coord.type='deg')
##D 
##D #Now removing the margins and putting labels inside the image:
##D 
##D par(mar=c(0,0,0,0))
##D magimageWCS(image, margin=FALSE)
##D magimageWCS(image, margin=FALSE, coord.type='deg')
##D 
##D #We can make a WCS colour image of mismatched images:
##D 
##D VISTA_K=readFITS(system.file("extdata", 'VISTA_K.fits', package="magicaxis"))
##D VST_r=readFITS(system.file("extdata", 'VST_r.fits', package="magicaxis"))
##D GALEX_NUV=readFITS(system.file("extdata", 'GALEX_NUV.fits', package="magicaxis"))
##D 
##D magimageWCSRGB(VISTA_K, VST_r, GALEX_NUV)
##D magimageWCSRGB(VISTA_K, VST_r, GALEX_NUV, saturation=0.5)
##D 
##D magimageWCSRGB(VISTA_K, VST_r, GALEX_NUV, VISTA_K$hdr)
##D magimageWCSRGB(VISTA_K, VST_r, GALEX_NUV, VST_r$hdr)
##D magimageWCSRGB(VISTA_K, VST_r, GALEX_NUV, GALEX_NUV$hdr)
## End(Not run)



