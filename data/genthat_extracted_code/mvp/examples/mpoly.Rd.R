library(mvp)


### Name: mpoly
### Title: Conversion to and from mpoly form
### Aliases: mpoly mpoly_to_mvp mvp_to_mpoly as.mpoly.mvp
### Keywords: symbolmath

### ** Examples


x <- rmvp(5)

x == mpoly_to_mvp(mpoly::as.mpoly(x))        # should be TRUE



