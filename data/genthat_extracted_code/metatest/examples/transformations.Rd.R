library(metatest)


### Name: transformations
### Title: Transform effect sizes.
### Aliases: transformations r2z z2r z2d r2d
### Keywords: univar

### ** Examples


## The function r2z is currently defined as
function(r) {
	return(0.5*(log(1+r)-log(1-r)))
  }



