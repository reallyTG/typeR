library(NNS)


### Name: UPM.ratio
### Title: Upper Partial Moment RATIO
### Aliases: UPM.ratio
### Keywords: CDF continuous mean, moments, partial upper variance,

### ** Examples

set.seed(123)
x <- rnorm(100)
UPM.ratio(0, mean(x), x)

## Joint Upper CDF
## Not run: 
##D x <- rnorm(5000) ; y <- rnorm(5000)
##D plot3d(x, y, Co.UPM(0, 0, sort(x), sort(y), x, y), col = "blue", xlab = "X", ylab = "Y",
##D zlab = "Probability", box = FALSE)
## End(Not run)



