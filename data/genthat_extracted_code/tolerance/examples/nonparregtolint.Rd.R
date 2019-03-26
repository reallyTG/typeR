library(tolerance)


### Name: npregtol.int
### Title: Nonparametric Regression Tolerance Bounds
### Aliases: npregtol.int
### Keywords: file

### ** Examples
 
## 95%/95% 2-sided nonparametric regression tolerance bounds
## for a sample of size 50. 

set.seed(100)
x <- runif(50, 5, 45)
f1 <- function(x, b1, b2) b1 + (0.49 - b1)*exp(-b2*(x - 8)) +
               rnorm(50, sd = 0.01) 
y <- f1(x, 0.39, 0.11)
y.hat <- loess(y~x)$fit
out <- npregtol.int(x = x, y = y, y.hat = y.hat, side = 2, 
                    alpha = 0.05, P = 0.95, method = "WILKS")
out

plottol(out, x = x, y = y, y.hat = y.hat, side = "two", 
        x.lab = "X", y.lab = "Y")



