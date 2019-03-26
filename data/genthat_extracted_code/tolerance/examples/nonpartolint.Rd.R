library(tolerance)


### Name: nptol.int
### Title: Nonparametric Tolerance Intervals
### Aliases: nptol.int
### Keywords: file

### ** Examples
 
## 90%/95% 2-sided nonparametric tolerance intervals for a 
## sample of size 20. 

set.seed(100)
x <- rlogis(20, 5, 1)
out <- nptol.int(x = x, alpha = 0.10, P = 0.95, side = 1,
                 method = "WILKS", upper = NULL, lower = NULL)
out

plottol(out, x, plot.type = "both", side = "two", x.lab = "X")



