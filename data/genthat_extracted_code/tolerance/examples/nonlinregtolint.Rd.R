library(tolerance)


### Name: nlregtol.int
### Title: Nonlinear Regression Tolerance Bounds
### Aliases: nlregtol.int
### Keywords: file

### ** Examples
 
## 95%/95% 2-sided nonlinear regression tolerance bounds
## for a sample of size 50. 

set.seed(100)
x <- runif(50, 5, 45)
f1 <- function(x, b1, b2) b1 + (0.49 - b1)*exp(-b2*(x - 8)) +
               rnorm(50, sd = 0.01) 
y <- f1(x, 0.39, 0.11)
formula <- as.formula(y ~ b1 + (0.49 - b1)*exp(-b2*(x - 8)))
out <- nlregtol.int(formula = formula, 
                    xy.data = data.frame(cbind(y, x)), 
                    x.new=cbind(c(10, 20)), side = 2, 
                    alpha = 0.05, P = 0.95)
out

plottol(out, x = x, y = y, side = "two", x.lab = "X", 
         y.lab = "Y")



