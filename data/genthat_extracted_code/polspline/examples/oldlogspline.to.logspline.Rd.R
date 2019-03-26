library(polspline)


### Name: oldlogspline.to.logspline
### Title: Logspline Density Estimation - 1992 to 1997 version
### Aliases: oldlogspline.to.logspline
### Keywords: distribution smooth

### ** Examples

x <- rnorm(100)
fit.old <- oldlogspline(x)
fit.translate <- oldlogspline.to.logspline(fit.old,x)
fit.new <- logspline(x)
plot(fit.new)
plot(fit.old,add=TRUE,col=2)
#
# should look almost the same, the differences are the
# different fitting routines
#



