library(statip)


### Name: picor
### Title: Piecewise-constant regression
### Aliases: picor knots.picor predict.picor plot.picor print.picor

### ** Examples

## Not run: 
##D s <- stats::stepfun(c(-1,0,1), c(1., 2., 4., 3.))
##D x <- stats::rnorm(1000)
##D y <- s(x)
##D p <- picor(y ~ x, data.frame(x = x, y = y))
##D print(p)
##D plot(p)
## End(Not run)




