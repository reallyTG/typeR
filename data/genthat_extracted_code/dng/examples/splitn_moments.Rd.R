library(dng)


### Name: splitn_kurtosis
### Title: Moments of the split normal distribution
### Aliases: splitn_kurtosis splitn_moments splitn_mean splitn_skewness
###   splitn_var
### Keywords: asymmetric distribution normal

### ** Examples


mu <- c(0,1,2)
sigma <- c(0.5,1,2)
lmd <- c(1,2,3)

mean0 <- splitn_mean(mu, sigma, lmd)
var0 <- splitn_var(sigma, lmd)
skewness0 <- splitn_skewness(sigma, lmd)
kurtosis0 <- splitn_kurtosis(lmd)



