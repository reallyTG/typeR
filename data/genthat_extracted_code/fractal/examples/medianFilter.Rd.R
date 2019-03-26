library(fractal)


### Name: medianFilter
### Title: Median filtering of a time series
### Aliases: medianFilter
### Keywords: univar models nonlinear

### ** Examples

x      <- beamchaos@data
x      <- x - mean(x)
sigma  <- stdev(x)
xnoise <- x + rnorm(length(x)) * sigma / 3
xclean <- medianFilter(xnoise, order=10)
y <- data.frame(xclean, xnoise, x)

stackPlot(x=positions(beamchaos)[], y=y,
    ylab=c("denoised","noisy","original"),
    ylim=range(y))



