library(entropy)


### Name: entropy.ChaoShen
### Title: Chao-Shen Entropy Estimator
### Aliases: entropy.ChaoShen
### Keywords: univar

### ** Examples

# load entropy library 
library("entropy")

# observed counts for each bin
y = c(4, 2, 3, 0, 2, 4, 0, 0, 2, 1, 1)  

# estimate entropy using Chao-Shen method
entropy.ChaoShen(y)

# compare to empirical estimate
entropy.empirical(y)



