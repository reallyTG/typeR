library(aplpack)


### Name: hdepth
### Title: hdepth of points
### Aliases: hdepth

### ** Examples

  # computation of h-depths
  data <- cbind(rnorm(40), rnorm(40)) 
  xy <- cbind(runif(50,-2,2),runif(50,-2,2))
  bagplot(data); text(xy, as.character(hdepth(xy,data)))



