library(rgam)


### Name: rgam
### Title: Outlier-robust fit for Generalized Additive Models
### Aliases: rgam
### Keywords: models, regression, robust, smooth

### ** Examples

x <- ili.visits$week
y <- ili.visits$visits
set.seed(123)
x <- x + rnorm(x, mean=0, sd=.01)
#
# the following command needs to run over 890 fits
# and takes about 22 mins on an Intel Xeon CPU (3.2GHz)
#
# a <- rgam(x=x, y=y, family='poisson', cv.method='rcv',
#  epsilon=1e-5, alpha=12:20/80, max.it=500)
#
# the optimal is found at alpha = 17/80
#
a <- rgam(x=x, y=y, family='poisson', cv.method='rcv',
epsilon=1e-7, alpha=17/80, max.it=500)

pr.rgam.a <- predict(a, type='response')
plot(x, y, xlab='Week', ylab='ILI visits', pch=19, col='grey75')
lines(x[order(x)], pr.rgam.a[order(x)], lwd=3, col='red')



