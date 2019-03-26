library(agsemisc)


### Name: plotf
### Title: Plot to multiple devices
### Aliases: plotf
### Keywords: device

### ** Examples

  x = runif(40)*4
  y = x + runif(40)
  plotf(expression(plot(x, y, type="p"))) # plots to active device only
  plotf(xyplot(y~x), "myplot", type=c("active", "png", "pdf"), size=c(3,3))



