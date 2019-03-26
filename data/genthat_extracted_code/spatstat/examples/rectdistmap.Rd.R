library(spatstat)


### Name: rectdistmap
### Title: Distance Map Using Rectangular Distance Metric
### Aliases: rectdistmap
### Keywords: spatial math

### ** Examples

  V <- letterR
  Frame(V) <- grow.rectangle(Frame(V), 0.5)
  plot(rectdistmap(V))



