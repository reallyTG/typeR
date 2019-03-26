library(tolerance)


### Name: umatol.int
### Title: Uniformly Most Accurate Upper Tolerance Limits for Certain
###   Discrete Distributions
### Aliases: umatol.int
### Keywords: file

### ** Examples
 
## Examples from Zacks (1970).

umatol.int(25, n = 4, dist = "Bin", N = 10, alpha = 0.10, 
           P = 0.95)
umatol.int(13, n = 10, dist = "NegBin", N = 2, alpha = 0.10,
           P = 0.95)
umatol.int(37, n = 10, dist = "Pois", alpha = 0.10, P = 0.95)



