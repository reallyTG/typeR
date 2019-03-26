library(attrCUSUM)


### Name: getContl
### Title: Compute Control Limits for Attribute FSI CUSUM Chart
### Aliases: getContl

### ** Examples

# Example 1: Poisson distribution
getContl(anss.target = 200, refv = 5, c.zero = 0,
         process = function(x) dpois(x, lambda = 4))



