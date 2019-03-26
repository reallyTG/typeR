library(greybox)


### Name: ds
### Title: S Distribution
### Aliases: ds ps qs rs
### Keywords: distribution

### ** Examples

x <- ds(c(-1000:1000)/10, 0, 1)
plot(x, type="l")

x <- ps(c(-1000:1000)/10, 0, 1)
plot(x, type="l")

qs(c(0.025,0.975), 0, 1)

x <- rs(1000, 0, 1)
hist(x)




