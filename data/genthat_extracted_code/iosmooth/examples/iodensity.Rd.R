library(iosmooth)


### Name: iodensity
### Title: Kernel density estimation with infinite order kernels
### Aliases: iodensity
### Keywords: kernel density flat-top

### ** Examples

x <- rnorm(100)
bwplot(x)
h <- bwadap(x)
plot(iodensity(x, bw=h, kernel="Trap", n.points=300), type="l")
rug(x)



