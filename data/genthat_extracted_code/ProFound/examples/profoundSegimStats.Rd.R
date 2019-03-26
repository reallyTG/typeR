library(ProFound)


### Name: profoundSegimInfo
### Title: Image Segmentation Statistics
### Aliases: profoundSegimStats profoundSegimPlot
### Keywords: segmentation

### ** Examples

## Not run: 
##D image=readFITS(system.file("extdata", 'VIKING/mystery_VIKING_Z.fits', package="ProFound"))
##D profound=profoundProFound(image, magzero=30, rotstats=TRUE)
##D 
##D print(profound$segstats)
##D 
##D #Note row 6 (the central galaxy) gains 0.05 mag of flux due to the missing flux when
##D #rotated through 180 degrees. The reflected value of 18.4 is closer to the full profile
##D #solution (~18.35) than the non-reflected flux (18.45).
##D 
##D profound$segim[35:55, 80:100]=max(profound$segim)+1
##D print(profoundSegimStats(image$imDat, segim=profound$segim, sky=profound$sky,
##D header=image$hdr))
##D profoundSegimPlot(image, profound$segim)
## End(Not run)



