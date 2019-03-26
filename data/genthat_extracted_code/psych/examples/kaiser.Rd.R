library(psych)


### Name: kaiser
### Title: Apply the Kaiser normalization when rotating factors
### Aliases: kaiser
### Keywords: multivariate models

### ** Examples

f3 <- fa(Thurstone,3)
f3n <- kaiser(fa(Thurstone,3,rotate="none"))
f3p <- kaiser(fa(Thurstone,3,rotate="none"),rotate="Promax",m=3)
factor.congruence(list(f3,f3n,f3p))



