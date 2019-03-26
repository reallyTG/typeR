library(NNS)


### Name: LPM.ratio
### Title: Lower Partial Moment RATIO
### Aliases: LPM.ratio
### Keywords: CDF continuous mean, moments, partial variance,

### ** Examples

set.seed(123)
x <- rnorm(100)
LPM.ratio(0, mean(x), x)

## Continuous CDF
LPM.ratio(1, sort(x), x)


## Joint CDF
## Not run: 
##D x <- rnorm(5000) ; y <- rnorm(5000)
##D plot3d(x, y, Co.LPM(0, 0, sort(x), sort(y), x, y), col = "blue", xlab = "X", ylab = "Y",
##D zlab = "Probability", box = FALSE)
## End(Not run)



