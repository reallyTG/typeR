library(MonoInc)


### Name: data.r
### Title: Data range
### Aliases: data.r
### Keywords: datasets CDC

### ** Examples

data(data.r)
## plot Range boundary lines
tol <- 3
plot(data.r$Age, data.r$Per_5, type="l", lty=2, col=2)
lines(data.r$Age, data.r$Per_95, type="l", lty=2, col=2)
lines(data.r$Age, data.r$Per_5 - tol, type="l", lty=2, col=4)
lines(data.r$Age, data.r$Per_95 + tol, type="l", lty=2, col=4)



