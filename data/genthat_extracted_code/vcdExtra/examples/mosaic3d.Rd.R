library(vcdExtra)


### Name: mosaic3d
### Title: 3D Mosaic Plots
### Aliases: mosaic3d mosaic3d.default mosaic3d.loglm
### Keywords: hplot

### ** Examples

# 2 x 2 x 2
mosaic3d(Bartlett, box=TRUE)
# compare with expected frequencies under model of mutual independence
mosaic3d(Bartlett, type="expected", box=TRUE)
	
# 2 x 2 x 3
mosaic3d(Heart, box=TRUE)
	
## Not run: 
##D # 2 x 2 x 2 x 3
##D # illustrates a 4D table
##D mosaic3d(Detergent)
##D 
##D # compare 2D and 3D mosaics
##D demo("mosaic-hec")
## End(Not run)




