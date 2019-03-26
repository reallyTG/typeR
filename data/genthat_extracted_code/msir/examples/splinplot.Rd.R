library(msir)


### Name: spinplot
### Title: Rotating three-dimensional plot
### Aliases: spinplot

### ** Examples

## Not run: 
##D x1 <- rnorm(100)
##D x2 <- rnorm(100)
##D y  <- 2*x1 + x2^2 + 0.5*rnorm(100)
##D spinplot(x1, y, x2)
##D spinplot(x1, y, x2, scaling = "aaa")
##D spinplot(x1, y, x2, rem.lin.trend = "TRUE")
##D spinplot(x1, y, x2, fit.smooth = TRUE)
##D spinplot(x1, y, x2, fit.ols = TRUE)
##D 
##D x <- iris[,1:3]
##D y <- iris[,5]
##D spinplot(x)
##D spinplot(x, markby = y)
##D spinplot(x, markby = y, col.points = c("dodgerblue2", "orange", "green3"))
##D spinplot(x, markby = y, pch = c(0,3,1), col.points = c("dodgerblue2", "orange", "green3"))
##D 
##D # to save plots use 
##D # rgl.postscript("plot.pdf", fmt="pdf")
##D # or
##D # rgl.snapshot("plot.png")
## End(Not run)



