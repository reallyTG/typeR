library(tolerance)


### Name: laptol.int
### Title: Laplace Tolerance Intervals
### Aliases: laptol.int
### Keywords: file

### ** Examples
 
## First generate data from a Laplace distribution with location
## parameter 70 and scale parameter 3.

set.seed(100)
tmp <- runif(40)
x <- rep(70, 40) - sign(tmp - 0.5)*rep(3, 40)*
              log(2*ifelse(tmp < 0.5, tmp, 1-tmp))

## 95%/90% 1-sided Laplace tolerance intervals for the sample
## of size 40 generated above. 

out <- laptol.int(x = x, alpha = 0.05, P = 0.90, side = 1) 
out

plottol(out, x, plot.type = "hist", side = "two", 
        x.lab = "Laplace Data")



