library(seewave)


### Name: autoc
### Title: Short-term autocorrelation of a time wave
### Aliases: autoc
### Keywords: dplot ts

### ** Examples

data(sheep)
# fundamental frequency of a sheep
res <- autoc(sheep, f=8000, threshold=5, fmin=100, fmax=700, plot=FALSE)
spectro(sheep, f=8000, ovlp=75, scale=FALSE)
points(res, pch=20)
legend(0.5, 3.6, "Fundamental frequency", pch=20, bty=0, cex=0.7)



