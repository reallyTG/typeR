library(Directional)


### Name: Contour plot of the Kent distribution for some data
### Title: Contour plot of the Kent distribution for some data
### Aliases: kent.datacontour
### Keywords: Contour plot Kent distribution

### ** Examples

x <- rvmf(100, rnorm(3), 10)
kent.mle(x)
y <- euclid.inv(x)
kent.datacontour(y)
vmf.kerncontour(y, thumb = "none")



