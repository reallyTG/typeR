library(tolerance)


### Name: simnormtol.int
### Title: Simultaneous Normal (or Log-Normal) Tolerance Intervals
### Aliases: simnormtol.int
### Keywords: file

### ** Examples
 
## 95%/95% simultaneous 2-sided normal tolerance 
## intervals for three samples of unequal size. 

set.seed(100)
x <- list(rnorm(20),rnorm(10,1),rnorm(12,1,2))
out <- simnormtol.int(x = x, alpha = 0.05, P = 0.95, 
                      side = 2, method = "BONF")
out



