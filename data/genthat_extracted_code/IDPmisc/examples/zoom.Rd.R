library(IDPmisc)


### Name: zoom
### Title: Zooming in and out in a 2d-Plot
### Aliases: zoom
### Keywords: iplot dynamic

### ** Examples

i <- 1:100
y <- i*sin(i*(pi/16))
y <- c(rev(y),y)

## Not run:
zoom(fun=plot, zoom.col="red", x=1:200, y=y, type="l", xlab="index")
## End( Not run)



