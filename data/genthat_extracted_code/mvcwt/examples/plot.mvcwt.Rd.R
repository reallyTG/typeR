library(mvcwt)


### Name: plot.mvcwt
### Title: Plot wavelet output
### Aliases: plot.mvcwt
### Keywords: graphics

### ** Examples

## Not run: 
##D data(lrlake)
##D x = subset(lrlake, Basin == "Reference", LRL.Day) / 365.25
##D y = subset(lrlake, Basin == "Reference", -(1:8))
##D w = mvcwt(x, y, min.scale = 0.25, max.scale = 4)
##D plot(w, var = 1:10)
## End(Not run)



