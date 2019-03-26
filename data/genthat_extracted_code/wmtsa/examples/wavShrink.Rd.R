library(wmtsa)


### Name: wavShrink
### Title: Nonlinear denoising via wavelet shrinkage
### Aliases: wavShrink
### Keywords: nonlinear

### ** Examples

## MODWT waveshrinking using various thresh.scale 
## values on sunspots series 
x <- as.vector(sunspots)
tt <- as.numeric(time(sunspots))
thresh <- seq(0.5,2,length=4)
ws <- lapply(thresh, function(k,x)
    wavShrink(x, wavelet="s8",
       shrink.fun="hard", thresh.fun="universal",
       thresh.scale=k, xform="modwt"), x=x)

ifultools::stackPlot(x=tt, y=data.frame(x, ws),
    ylab=c("sunspots",thresh),
    xlab="Time")

## DWT waveshrinking using various threshold 
## functions 
threshfuns <- c("universal", "minimax", "adaptive")
ws <- lapply(threshfuns, function(k,x)
    wavShrink(x, wavelet="s8",
       thresh.fun=k, xform="dwt"), x=x)

ifultools::stackPlot(x=tt, y=data.frame(x, ws),
ylab=c("original", threshfuns),
xlab="Normalized Time")



