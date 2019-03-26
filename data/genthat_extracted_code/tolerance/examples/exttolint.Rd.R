library(tolerance)


### Name: exttol.int
### Title: Weibull (or Extreme-Value) Tolerance Intervals
### Aliases: exttol.int
### Keywords: file

### ** Examples
 
## 85%/90% 1-sided Weibull tolerance intervals for a sample
## of size 150. 

set.seed(100)
x <- rweibull(150, 3, 75)
out <- exttol.int(x = x, alpha = 0.15, P = 0.90, side = 1,
                  dist = "Weibull")
out

plottol(out, x, plot.type = "both", side = "lower", 
        x.lab = "Weibull Data")



