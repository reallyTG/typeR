library(iosmooth)


### Name: bwplot.numeric
### Title: Bandwidth plot for density estimation or regression
### Aliases: bwplot.numeric
### Keywords: Flat-top kernel Density estimate Nadaraya-Watson kernel
###   smoother

### ** Examples

### Density Estimation
set.seed(123)
x <- rnorm(100)
bwplot(x, smax=8)
#Choose bandwidth roughly h=1/2
plot(iodensity(x, bw=1/2), type="l")
rug(x)

#### Nadaraya-Watson kernel regression
y <- sin(x) + .1 *rnorm(100)
bwplot(x,y, smax=12)
# Choose bandwidth roughly h = 1/2.5
plot(x, y)
lines(ioksmooth(x, y, bw = 1/2.5, kernel="SupSm"), type="l")



