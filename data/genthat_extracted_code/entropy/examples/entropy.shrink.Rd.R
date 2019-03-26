library(entropy)


### Name: entropy.shrink
### Title: Shrinkage Estimators of Entropy, Mutual Information and Related
###   Quantities
### Aliases: freqs.shrink entropy.shrink KL.shrink chi2.shrink mi.shrink
###   chi2indep.shrink
### Keywords: univar

### ** Examples

# load entropy library 
library("entropy")

# a single variable

# observed counts for each bin
y = c(4, 2, 3, 0, 2, 4, 0, 0, 2, 1, 1)  

# shrinkage estimate of frequencies
freqs.shrink(y)

# shrinkage estimate of entropy
entropy.shrink(y)


# example with two variables

# observed counts for two random variables
y1 = c(4, 2, 3, 1, 10, 4)
y2 = c(2, 3, 7, 1, 4, 3)

# shrinkage estimate of Kullback-Leibler divergence
KL.shrink(y1, y2)

# half of the shrinkage chi-squared statistic
0.5*chi2.shrink(y1, y2)


## joint distribution example

# contingency table with counts for two discrete variables
y2d = rbind( c(1,2,3), c(6,5,4) )

# shrinkage estimate of mutual information
mi.shrink(y2d)

# half of the shrinkage chi-squared statistic of independence
0.5*chi2indep.shrink(y2d)





