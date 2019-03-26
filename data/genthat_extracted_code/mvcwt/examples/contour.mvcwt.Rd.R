library(mvcwt)


### Name: contour.mvcwt
### Title: Make contour plot of a 'mvcwt' object
### Aliases: contour.mvcwt
### Keywords: graphics

### ** Examples

## Not run: 
##D data(lrlake)
##D x = subset(lrlake, Basin == "Treatment", LRL.Day) / 365.25
##D y = subset(lrlake, Basin == "Treatment", -(1:8))
##D w = mvcwt(x, y, min.scale = 0.25, max.scale = 4)
##D mr = wmr(w)
##D contour(mr)
## End(Not run)



