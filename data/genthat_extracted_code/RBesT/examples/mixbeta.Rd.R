library(RBesT)


### Name: mixbeta
### Title: Beta Mixture Density
### Aliases: mixbeta ms2beta mn2beta summary.betaMix
###   summary.betaBinomialMix

### ** Examples

## a beta mixture
bm <- mixbeta(rob=c(0.2, 2, 10), inf=c(0.4, 10, 100), inf2=c(0.4, 30, 80))

# mean/standard deviation parametrization
bm2 <- mixbeta(rob=c(0.2, 0.3, 0.2), inf=c(0.8, 0.4, 0.01), param="ms")

# mean/observations parametrization
bm3 <- mixbeta(rob=c(0.2, 0.3, 5), inf=c(0.8, 0.4, 30), param="mn")

# even mixed is possible
bm4 <- mixbeta(rob=c(0.2, mn2beta(0.3, 5)), inf=c(0.8, ms2beta(0.4, 0.1)))

# print methods are defined
bm4
print(bm4)




