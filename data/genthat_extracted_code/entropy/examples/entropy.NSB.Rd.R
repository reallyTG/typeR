library(entropy)


### Name: entropy.NSB
### Title: R Interface to NSB Entropy Estimator
### Aliases: entropy.NSB
### Keywords: univar

### ** Examples

# load entropy library 
library("entropy")

# observed counts for each bin
y = c(4, 2, 3, 0, 2, 4, 0, 0, 2, 1, 1)  

## Not run: 
##D # estimate entropy using the NSB method
##D entropy.NSB(y) # 2.187774
## End(Not run)

# compare to empirical estimate
entropy.empirical(y)



