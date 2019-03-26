library(tolerance)


### Name: cautol.int
### Title: Cauchy Tolerance Intervals
### Aliases: cautol.int
### Keywords: file

### ** Examples
 
## 95%/90% 2-sided Cauchy tolerance interval for a sample 
## of size 1000. 

set.seed(100)
x <- rcauchy(1000, 100000, 10)
out <- cautol.int(x = x, alpha = 0.05, P = 0.90, side = 2)
out

plottol(out, x, plot.type = "both", x.lab = "Cauchy Data")



