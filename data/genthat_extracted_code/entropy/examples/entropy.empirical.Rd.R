library(entropy)


### Name: entropy.empirical
### Title: Empirical Estimators of Entropy and Mutual Information and
###   Related Quantities
### Aliases: freqs.empirical entropy.empirical KL.empirical chi2.empirical
###   mi.empirical chi2indep.empirical
### Keywords: univar

### ** Examples

# load entropy library 
library("entropy")


# a single variable

# observed counts for each bin
y = c(4, 2, 3, 0, 2, 4, 0, 0, 2, 1, 1)  

# empirical frequencies
freqs.empirical(y)

# empirical estimate of entropy
entropy.empirical(y)


# example with two variables

# observed counts for two random variables
y1 = c(4, 2, 3, 1, 10, 4)
y2 = c(2, 3, 7, 1, 4, 3)

# empirical Kullback-Leibler divergence
KL.empirical(y1, y2)

# half of the empirical chi-squared statistic
0.5*chi2.empirical(y1, y2)


## joint distribution example

# contingency table with counts for two discrete variables
y2d = rbind( c(1,2,3), c(6,5,4) )

# empirical estimate of mutual information
mi.empirical(y2d)

# half of the empirical chi-squared statistic of independence
0.5*chi2indep.empirical(y2d)





