library(fractal)


### Name: localProjection
### Title: Time series denoising via a local projection filtering technique
### Aliases: localProjection
### Keywords: univar models nonlinear

### ** Examples

## Not run: 
##D x <- beamchaos@data
##D x <- x - mean(x)
##D sigma <- stdev(x)
##D xnoise <- x + rnorm(length(x)) * sigma / 3
##D xclean <- localProjection(xnoise, dimension=7, noise.dimension=5,
##D     max.distance=3*sigma, n.neighbor=100)
##D 
##D y <- data.frame(xclean, xnoise, x)
##D stackPlot(x=positions(beamchaos)[], y=y,
##D     ylab=c("denoised","noisy","original"),
##D     ylim=range(y))
## End(Not run)



