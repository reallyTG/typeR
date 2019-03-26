library(SCBmeanfd)


### Name: cv.score
### Title: Leave-One-Curve-out Cross-Validation Score
### Aliases: cv.score

### ** Examples

## Artificial example 
x <- seq(0, 1, len = 100)
mu <- x + .2 * sin(2 * pi * x)
y <- matrix(mu + rnorm(2000, sd = .25), 20, 100, byrow = TRUE)
h <- c(.005, .01, .02, .05, .1, .15)
cv <- numeric()
for (i in 1:length(h)) cv[i] <- cv.score(h[i], x, y, 1)
plot(h, cv, type = "l")

## Plasma citrate data
## Compare cross-validation scores and bandwidths  
## for local linear and local quadratic smoothing
## Not run: 
##D data(plasma)
##D time <- 8:21
##D h1 <- seq(.5, 1.3, .05)
##D h2 <- seq(.75, 2, .05)
##D cv1 <- sapply(h1, cv.score, x = time, y = plasma, degree = 1)
##D cv2 <- sapply(h2, cv.score, x = time, y = plasma, degree = 2)
##D plot(h1, cv1, type = "l", xlim = range(c(h1,h2)), ylim = range(c(cv1, cv2)), 
##D   xlab = "Bandwidth (hour)", ylab = "CV score", 
##D   main = "Cross validation for local polynomial estimation")
##D lines(h2, cv2, col = 2)
##D legend("topleft", legend = c("Linear", "Quadratic"), lty = 1, 
##D   col = 1:2, cex = .9)
##D 
##D ## Note: using local linear (resp. quadratic) smoothing 
##D ## with a bandwidth smaller than .5 (resp. .75) can result 
##D ## in non-definiteness or numerical instability of the estimator. 
## End(Not run)



