library(MonoInc)


### Name: decData.r
### Title: Data range(decreasing)
### Aliases: decData.r
### Keywords: datasets

### ** Examples

data(decData.r)

## plot Range boundary lines
tol <- 3
plot(decData.r[,1], decData.r[,2], type="l", lty=2, col=2)
lines(decData.r[,1], decData.r[,3], type="l", lty=2, col=2)
lines(decData.r[,1], decData.r[,2] - tol, type="l", lty=2, col=4)
lines(decData.r[,1], decData.r[,3] + tol, type="l", lty=2, col=4)



