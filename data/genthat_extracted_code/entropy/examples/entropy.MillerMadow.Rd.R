library(entropy)


### Name: entropy.MillerMadow
### Title: Miller-Madow Entropy Estimator
### Aliases: entropy.MillerMadow
### Keywords: univar

### ** Examples

# load entropy library 
library("entropy")

# observed counts for each bin
y = c(4, 2, 3, 0, 2, 4, 0, 0, 2, 1, 1)  

# estimate entropy using Miller-Madow method
entropy.MillerMadow(y)

# compare to empirical estimate
entropy.empirical(y)



