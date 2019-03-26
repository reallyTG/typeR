library(fda)


### Name: lines.fd
### Title: Add Lines from Functional Data to a Plot
### Aliases: lines.fd lines.fdSmooth
### Keywords: smooth

### ** Examples

##
## plot a fit with 3 levels of smoothing
##
x <- seq(-1,1,0.02)
y <- x + 3*exp(-6*x^2) + sin(1:101)/2
# sin not rnorm to make it easier to compare
# results across platforms 

result4.0  <- smooth.basisPar(argvals=x, y=y, lambda=1)
result4.m4 <- smooth.basisPar(argvals=x, y=y, lambda=1e-4)

plot(x, y)
lines(result4.0$fd)
lines(result4.m4$fd,      col='blue')
lines.fdSmooth(result4.0, col='red') 

plot(x, y, xlim=c(0.5, 1))
lines.fdSmooth(result4.0)
lines.fdSmooth(result4.m4, col='blue')
# no visible difference from the default?  




