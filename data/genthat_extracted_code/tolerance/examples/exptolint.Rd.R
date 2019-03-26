library(tolerance)


### Name: exptol.int
### Title: Exponential Tolerance Intervals
### Aliases: exptol.int
### Keywords: file

### ** Examples
 
## 95%/99% 1-sided exponential tolerance intervals for a
## sample of size 50. 

set.seed(100)
x <- rexp(100, 0.004)
out <- exptol.int(x = x, alpha = 0.05, P = 0.99, side = 1,
                  type.2 = FALSE)
out

plottol(out, x, plot.type = "both", side = "lower", 
        x.lab = "Exponential Data")



