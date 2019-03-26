library(mvcwt)


### Name: image.mvcwt
### Title: Draw a heatmap of a 'mvcwt' object
### Aliases: image.mvcwt
### Keywords: graphics

### ** Examples

## Not run: 
##D data(lrlake)
##D x = subset(lrlake, Basin == "Treatment", LRL.Day) / 365.25
##D y = subset(lrlake, Basin == "Treatment", -(1:8))
##D w = mvcwt(x, y, min.scale = 0.25, max.scale = 4)
##D image(w, z.fun = "Mod")
## End(Not run)



