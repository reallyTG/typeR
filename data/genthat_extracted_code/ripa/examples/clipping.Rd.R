library(ripa)


### Name: clipping
### Title: Clipping image
### Aliases: clipping
### Keywords: misc

### ** Examples

  data(logo)
  op <- par(mfrow=c(2,2))
  plot(logo, main="Source Image")

  # the appearance of next one doesn't change because of normalization.
  plot(normalize(2*logo), main="Doubled pixel value with normalization")

  # the next one is saturated as expected
  plot(clipping(2*logo), main="Doubled pixel value with clipping")



