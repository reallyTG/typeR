library(datautils)


### Name: .plot.deldir.datautils
### Title: .plot.deldir.datautils
### Aliases: plot.deldir

### ** Examples

xvals <- rnorm(50)
yvals <- rnorm(50)
res <- deldir(xvals, yvals)

rvalues <- runif(50)
gvalues <- runif(50)
bvalues <- runif(50)
plot(res, wlines="tess", fill=rgb(rvalues, gvalues, bvalues))



