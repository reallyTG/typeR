library(redR)


### Name: resample
### Title: Resampling of an image
### Aliases: resample

### ** Examples

im <- lenna
par(mfrow = c(1,2), mar = rep(0,4)+0.1)
plot(im, axes = FALSE, interp = FALSE)
plot(resample(im, 1/4), axes = FALSE, interp = FALSE)



