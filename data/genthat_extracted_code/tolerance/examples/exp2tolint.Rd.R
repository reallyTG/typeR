library(tolerance)


### Name: exp2tol.int
### Title: 2-Parameter Exponential Tolerance Intervals
### Aliases: exp2tol.int
### Keywords: file

### ** Examples
 
## 95%/90% 1-sided 2-parameter exponential tolerance intervals
## for a sample of size 50. 

set.seed(100)
x <- r2exp(50, 6, shift = 55)
out <- exp2tol.int(x = x, alpha = 0.05, P = 0.90, side = 1,
                   method = "DUN", type.2 = FALSE)
out

plottol(out, x, plot.type = "both", side = "upper", 
        x.lab = "2-Parameter Exponential Data")



