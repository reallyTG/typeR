library(tolerance)


### Name: uniftol.int
### Title: Uniform Tolerance Intervals
### Aliases: uniftol.int
### Keywords: file

### ** Examples
 
## 90%/90% 1-sided uniform tolerance intervals for a sample
## of size 50 with a known lower bound of 0. 

set.seed(100)
x <- runif(50, 0, 50)
out <- uniftol.int(x = x, alpha = 0.10, P = 0.90, lower = 0,
                   side = 1) 
out

plottol(out, x, plot.type = "hist", side = "two", 
        x.lab = "Uniform Data")



