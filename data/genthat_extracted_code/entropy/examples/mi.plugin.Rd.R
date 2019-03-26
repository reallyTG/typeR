library(entropy)


### Name: mi.plugin
### Title: Plug-In Estimator of Mutual Information and of the Chi-Squared
###   Statistic of Independence
### Aliases: mi.plugin chi2indep.plugin
### Keywords: univar

### ** Examples

# load entropy library 
library("entropy")

# joint distribution of two discrete variables
freqs2d = rbind( c(0.2, 0.1, 0.15), c(0.1, 0.2, 0.25) )  

# corresponding mutual information
mi.plugin(freqs2d)

# MI computed via entropy
H1 = entropy.plugin(rowSums(freqs2d))
H2 = entropy.plugin(colSums(freqs2d))
H12 = entropy.plugin(freqs2d)
H1+H2-H12

# and corresponding (half) chi-squared statistic of independence
0.5*chi2indep.plugin(freqs2d)




