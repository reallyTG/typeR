library(ProFound)


### Name: profoundSegimWarp
### Title: Remap Segmentation Map via Warping
### Aliases: profoundSegimWarp
### Keywords: WCS gnomonic warp

### ** Examples

## Not run: 
##D VST_r=readFITS(system.file("extdata", 'VST_r.fits', package="magicaxis"))
##D GALEX_NUV=readFITS(system.file("extdata", 'GALEX_NUV.fits', package="magicaxis"))
##D 
##D profound_KiDS=profoundProFound(VST_r, sky=0, skycut=1, sigma=2, tolerance=8, plot=TRUE)
##D 
##D segimFUV=profoundSegimWarp(profound_KiDS$segim, profound_KiDS$header, GALEX_NUV$hdr)
##D 
##D profoundSegimPlot(GALEX_NUV, segim = segimFUV)
##D 
##D profound_GALEX=profoundProFound(GALEX_NUV, segim=segimFUV, plot=TRUE)
## End(Not run)



