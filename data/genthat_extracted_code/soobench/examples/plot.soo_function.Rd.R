library(soobench)


### Name: plot.soo_function
### Title: Plot a test function in 2D.
### Aliases: plot.soo_function

### ** Examples

par(mfrow=c(2, 2))
f <- sphere_function(2)
plot(f)
plot(f, show="contour")
plot(f, rank=TRUE)
plot(f, log=TRUE)



