library(wmtsa)


### Name: wavCWTPeaks
### Title: Peak detection in a time series via the CWT
### Aliases: wavCWTPeaks
### Keywords: univar models nonlinear

### ** Examples

## create linchirp series 
linchirp <- make.signal("linchirp")

## calculate the CWT 
W <- wavCWT(linchirp)

## form CWT tree 
z <- wavCWTTree(W)

## estimate the peak locations using default 
## scale.range 
p <- wavCWTPeaks(z)

## plot an overlay of the original series and the 
## peaks 
x <- as(linchirp@positions,"numeric")
y <- linchirp@data
plot(x, y, type="l", xlab="time", ylab="linchirp")
points(p, pch=16, col="red", cex=1.2)



