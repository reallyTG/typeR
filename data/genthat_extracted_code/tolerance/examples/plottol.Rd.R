library(tolerance)


### Name: plottol
### Title: Plotting Capabilities for Tolerance Intervals
### Aliases: plottol
### Keywords: file

### ** Examples
 
## 90%/90% 1-sided Weibull tolerance intervals for a sample
## of size 150. 

set.seed(100)
x <- rweibull(150, 3, 75)
out <- exttol.int(x = x, alpha = 0.15, P = 0.90, 
                  dist = "Weibull")
out

plottol(out, x, plot.type = "both", side = "lower", 
        x.lab = "Weibull Data")

## 90%/90% trivariate normal tolerance region. 

set.seed(100)
x1 <- rnorm(100, 0, 0.2)
x2 <- rnorm(100, 0, 0.5)
x3 <- rnorm(100, 5, 1)
x <- cbind(x1, x2, x3)
mvtol.region(x = x, alpha = c(0.10, 0.05, 0.01), 
             P = c(0.90, 0.95, 0.99), B = 1000) 

out2 <- mvtol.region(x = x, alpha = 0.10, P = 0.90, B = 1000) 
out2
plottol(out2, x)

## 95%/95% 2-sided linear regression tolerance bounds
## for a sample of size 100. 

set.seed(100)
x <- runif(100, 0, 10)
y <- 20 + 5*x + rnorm(100, 0, 3)
out3 <- regtol.int(reg = lm(y ~ x), new.x = cbind(c(3, 6, 9)), 
                   side = 2, alpha = 0.05, P = 0.95)
plottol(out3, x = cbind(1, x), y = y, side = "two", x.lab = "X", 
        y.lab = "Y")




