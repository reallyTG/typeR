library(circular)


### Name: fisherB18
### Title: B.18 Wind direction and ozone concentration.
### Aliases: fisherB18 fisherB18c
### Keywords: datasets

### ** Examples

data(fisherB18)
data(fisherB18c)
par(mfcol=c(1,3))
plot(fisherB18c$theta, xlab=expression(theta))
boxplot(fisherB18c$x, xlab="x")
plot(c(fisherB18$x, fisherB18$x), c(fisherB18$theta,
  fisherB18$theta+360), xlab="x", ylab=expression(theta))



