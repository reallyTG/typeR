library(circular)


### Name: fisherB20
### Title: B.20 Movements of blue periwinkles.
### Aliases: fisherB20 fisherB20c
### Keywords: datasets

### ** Examples

data(fisherB20)
data(fisherB20c)
par(mfcol=c(1,3))
plot(fisherB20c$theta, xlab=expression(theta))
boxplot(fisherB20c$x, xlab="x")
plot(c(fisherB20$x, fisherB20$x), c(fisherB20$theta,
  fisherB20$theta+360), xlab="x", ylab=expression(theta))




