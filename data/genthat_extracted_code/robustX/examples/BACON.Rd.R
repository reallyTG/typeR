library(robustX)


### Name: BACON
### Title: BACON for Regression or Multivariate Covariance Estimation
### Aliases: BACON .lmBACON
### Keywords: robust regression

### ** Examples

data(starsCYG, package = "robustbase")
## Plot simple data and fitted lines
plot(starsCYG)
 lmST <-    lm(log.light ~ log.Te, data = starsCYG)
(B.ST <- with(starsCYG,  BACON(x = log.Te, y = log.light)))
require(robustbase)
(RlmST <- lmrob(log.light ~ log.Te, data = starsCYG))
abline(lmST, col = "red")
abline(RlmST, col = "blue")




