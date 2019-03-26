library(tolerance)


### Name: gamtol.int
### Title: Gamma (or Log-Gamma) Tolerance Intervals
### Aliases: gamtol.int
### Keywords: file

### ** Examples
 
## 99%/99% 1-sided gamma tolerance intervals for a sample
## of size 50. 

set.seed(100)
x <- rgamma(50, 0.30, scale = 2)
out <- gamtol.int(x = x, alpha = 0.01, P = 0.99, side = 1,
                  method = "HE")
out

plottol(out, x, plot.type = "both", side = "upper", 
        x.lab = "Gamma Data")



