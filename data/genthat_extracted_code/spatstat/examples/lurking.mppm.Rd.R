library(spatstat)


### Name: lurking.mppm
### Title: Lurking Variable Plot for Multiple Point Patterns
### Aliases: lurking.mppm
### Keywords: spatial models hplot

### ** Examples

  fit <- mppm(Points ~ Image + Group, demohyper)
  lurking(fit, expression(Image), type="P")
  lurking(fit, expression(Image), type="P", separate=TRUE)



