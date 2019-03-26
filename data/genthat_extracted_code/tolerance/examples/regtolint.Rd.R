library(tolerance)


### Name: regtol.int
### Title: (Multiple) Linear Regression Tolerance Bounds
### Aliases: regtol.int
### Keywords: file

### ** Examples
 
## 95%/95% 2-sided linear regression tolerance bounds
## for a sample of size 100. 

set.seed(100)
x <- runif(100, 0, 10)
y <- 20 + 5*x + rnorm(100, 0, 3)
out <- regtol.int(reg = lm(y ~ x), new.x = cbind(c(3, 6, 9)), 
                  side = 2, alpha = 0.05, P = 0.95)
out

plottol(out, x = cbind(1, x), y = y, side = "two", x.lab = "X", 
        y.lab = "Y")




