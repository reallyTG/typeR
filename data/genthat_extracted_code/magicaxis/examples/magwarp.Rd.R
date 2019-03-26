library(magicaxis)


### Name: magwarp
### Title: Remap Image WCS via Warping
### Aliases: magwarp
### Keywords: WCS gnomonic warp

### ** Examples

## Not run: 
##D VISTA_K=readFITS(system.file("extdata", 'VISTA_K.fits', package="magicaxis"))
##D VST_r=readFITS(system.file("extdata", 'VST_r.fits', package="magicaxis"))
##D GALEX_NUV=readFITS(system.file("extdata", 'GALEX_NUV.fits', package="magicaxis"))
##D 
##D magwarp(VST_r, GALEX_NUV$hdr, plot=TRUE)
##D magwarp(VISTA_K, GALEX_NUV$hdr, plot=TRUE)
##D 
##D magwarp(GALEX_NUV, VST_r$hdr, plot=TRUE)
##D magwarp(VISTA_K, VST_r$hdr, plot=TRUE)
##D 
##D magwarp(GALEX_NUV, VISTA_K$hdr, plot=TRUE)
##D magwarp(VST_r, VISTA_K$hdr, plot=TRUE)
## End(Not run)



