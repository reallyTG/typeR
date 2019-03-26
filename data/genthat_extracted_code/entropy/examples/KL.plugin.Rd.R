library(entropy)


### Name: KL.plugin
### Title: Plug-In Estimator of the Kullback-Leibler divergence and of the
###   Chi-Squared Statistic
### Aliases: KL.plugin chi2.plugin
### Keywords: univar

### ** Examples

# load entropy library 
library("entropy")

# probabilities for two random variables
freqs1 = c(1/5, 1/5, 3/5)
freqs2 = c(1/10, 4/10, 1/2) 

# KL divergence from X1 to X2
KL.plugin(freqs1, freqs2)

# and corresponding (half) chi-squared statistic
0.5*chi2.plugin(freqs1, freqs2)




