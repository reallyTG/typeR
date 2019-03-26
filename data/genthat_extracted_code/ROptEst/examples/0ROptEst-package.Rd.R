library(ROptEst)


### Name: ROptEst-package
### Title: Optimally robust estimation
### Aliases: ROptEst-package ROptEst
### Keywords: package

### ** Examples

## don't test to reduce check time on CRAN
## No test: 
library(ROptEst)

## Example: Rutherford-Geiger (1910); cf. Feller~(1968), Section VI.7 (a)
x <- c(rep(0, 57), rep(1, 203), rep(2, 383), rep(3, 525), rep(4, 532), 
       rep(5, 408), rep(6, 273), rep(7, 139), rep(8, 45), rep(9, 27), 
       rep(10, 10), rep(11, 4), rep(12, 0), rep(13, 1), rep(14, 1))

## ML-estimate from package distrMod
MLest <- MLEstimator(x, PoisFamily())
MLest
## confidence interval based on CLT
confint(MLest)

## compute optimally (w.r.t to MSE) robust estimator (unknown contamination)
robEst <- roptest(x, PoisFamily(), eps.upper = 0.1, steps = 3)
estimate(robEst)
## check influence curve
pIC(robEst)
checkIC(pIC(robEst))
## plot influence curve
plot(pIC(robEst))
## confidence interval based on LAN - neglecting bias
confint(robEst)
## confidence interval based on LAN - including bias
confint(robEst, method = symmetricBias())
## End(No test)



