library(mvcwt)


### Name: wmr
### Title: Compute the wavelet modulus ratio of multivariate data
### Aliases: wmr
### Keywords: wavelets

### ** Examples

## Not run: 
##D data(lrlake)
##D x = subset(lrlake, Basin == "Treatment", LRL.Day) / 365.25
##D y = subset(lrlake, Basin == "Treatment", -(1:8))
##D w = mvcwt(x, y, min.scale = 0.25, max.scale = 4)
##D mr = wmr(w)
##D image(mr, reset.par = FALSE)
##D contour(mr, bound = NA, add = TRUE)
## End(Not run)



