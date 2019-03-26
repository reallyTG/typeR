library(tolerance)


### Name: paretotol.int
### Title: Pareto (or Power Distribution) Tolerance Intervals
### Aliases: paretotol.int
### Keywords: file

### ** Examples
 
## 95%/99% 2-sided Pareto tolerance intervals 
## for a sample of size 500. 

set.seed(100)
x <- exp(r2exp(500, rate = 0.15, shift = 2))
out <- paretotol.int(x = x, alpha = 0.05, P = 0.99, side = 2,
                     method = "DUN", power.dist = FALSE)
out

plottol(out, x, plot.type = "both", side = "two", 
        x.lab = "Pareto Data")



