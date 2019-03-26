library(dng)


### Name: splitt_kurtosis
### Title: Moments of the split-t distribution
### Aliases: splitt_kurtosis splitt_moments splitt_mean splitt_skewness
###   splitt_var
### Keywords: asymmetric distribution student-t

### ** Examples


mu <- c(0,1,2)
df <- rep(10,3)
phi <- c(0.5,1,2)
lmd <- c(1,2,3)

mean0 <- splitt_mean(mu, df, phi, lmd)
var0 <- splitt_var(df, phi, lmd)
skewness0 <- splitt_skewness(df, phi, lmd)
kurtosis0 <- splitt_kurtosis(df, phi, lmd)



