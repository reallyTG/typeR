library(tolerance)


### Name: norm.ss
### Title: Sample Size Determination for Normal Tolerance Intervals
### Aliases: norm.ss
### Keywords: file

### ** Examples
 
## Sample size determination for 95%/95% 2-sided normal 
## tolerance intervals using the direct method.
 
set.seed(100)
norm.ss(alpha = 0.05, P = 0.95, side = 2, spec = c(-3, 3), 
        method = "DIR", hyper.par = list(mu.0 = 0, 
        sig2.0 = 1))




