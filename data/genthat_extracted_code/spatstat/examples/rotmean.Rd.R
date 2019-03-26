library(spatstat)


### Name: rotmean
### Title: Rotational Average of a Pixel Image
### Aliases: rotmean
### Keywords: spatial math

### ** Examples

  if(interactive()) {
    Z <- setcov(square(1))
    plot(rotmean(Z))
    plot(rotmean(Z, result="im"))
  } else {
    Z <- setcov(square(1), dimyx=32)
    f <- rotmean(Z)
  }



