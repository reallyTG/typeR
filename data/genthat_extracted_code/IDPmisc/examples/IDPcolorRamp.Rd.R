library(IDPmisc)


### Name: IDPcolorRamp
### Title: Color Ramp for Ordered Values
### Aliases: IDPcolorRamp
### Keywords: color

### ** Examples

IDPcolorRamp(10)

## Default IDPcolorRamp in 21 colors
n <- 21
showColors(IDPcolorRamp(n),border=FALSE)

## colorRamp optimized to return at equidistant indices the colors
## light blue, light green, yellow, orange, red, dark violet
## works fine with n > 7
cInt <- data.frame(h = c(0.47, 0.28, 0.16, 0, 1, 0.8),
                   s = c(0.31, 0.55, 0.7, 0.8, 0.8, 1),
                   v = c(1, 1, 1, 1, 1, 0.5))

fr <- c(0.15, 0.25, 0.45, 0.0)
ii <- seq(1,n,length.out=6)

## colors at equidistant indices
showColors(IDPcolorRamp(n, colInt = cInt, fr =fr)[ii], border=FALSE)

## Alternative ramp in 21 colors
showColors(IDPcolorRamp(n, colInt = cInt, fr =fr), border=FALSE)



