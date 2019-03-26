library(ProFound)


### Name: ProFound
### Title: ProFound Source Detection
### Aliases: profoundProFound profound
### Keywords: Segmentation Detection

### ** Examples

## Not run: 
##D image=readFITS(system.file("extdata", 'VIKING/mystery_VIKING_Z.fits', package="ProFound"))
##D 
##D profound=profoundProFound(image, magzero=30, verbose=TRUE, plot=TRUE)
##D 
##D # You can check to see if the final objects mask is aggressive enough. Notice the halos
##D # surrounding bright sources when just using the objects mask.
##D 
##D temp=image$imDat
##D temp[profound$objects>0]=0
##D magimage(temp)
##D temp=image$imDat
##D temp[profound$objects_redo>0]=0
##D magimage(temp)
##D 
##D magplot(profound$segstats[,c("R50","SB_N90")], log='x', grid=TRUE)
##D magplot(profound$segstats[,c("R50","SB_N90")], log='x', grid=TRUE)
##D 
##D magplot(profound$segstats[,c("flux","origfrac")], log='x', grid=TRUE)
##D 
##D ## An example of a large galaxy:
##D 
##D VST_r=readFITS(system.file("extdata", 'VST_r.fits', package="magicaxis"))
##D 
##D # Running on defaults results in the central galaxy subtracting itself:
##D plot(profoundProFound(VST_r))
##D 
##D # Setting boxters=2 fixes things nicely:
##D plot(profoundProFound(VST_r, boxiters=2))
## End(Not run)



