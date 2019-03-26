library(ampd)


### Name: AMPD
### Title: AMPD
### Aliases: AMPD
### Keywords: detection peak

### ** Examples

t = seq(0,2,0.005)
data = sin(25*t)*sin(0.3*t)+0.4*t
dataNoise = jitter(data,1000)
result = AMPD(dataNoise)
result2 = AMPD(dataNoise, extended=TRUE)
par(mfrow=c(1,2))
plot(dataNoise, main="traditional algorithm", type="l")
points(result$maximaLoc, dataNoise[result$maximaLoc],col="red")
plot(dataNoise, main="extended algorithm", type="l")
points(result2$maximaLoc, dataNoise[result2$maximaLoc],col="red")



