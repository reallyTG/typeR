library(RBesT)


### Name: mixgamma
### Title: The Gamma Mixture Distribution
### Aliases: mixgamma ms2gamma mn2gamma summary.gammaMix
###   summary.gammaPoissonMix

### ** Examples

# Gamma mixture with robust and informative component
gmix <- mixgamma(rob=c(0.3, 20, 4), inf=c(0.7, 50, 10))

# objects can be printed
gmix
# or explicitly
print(gmix)

# summaries are defined
summary(gmix)

# sub-components may be extracted
# by component number
gmix[[2]]
# or component name
gmix[["inf"]]

# alternative mean and standard deviation parametrization
gmsMix <- mixgamma(rob=c(0.5, 8, 0.5), inf=c(0.5, 9, 2), param="ms")

# or mean and number of observations parametrization
gmnMix <- mixgamma(rob=c(0.2, 2, 1), inf=c(0.8, 2, 5), param="mn")

# and mixed parametrizations are also possible
gfmix <- mixgamma(rob1=c(0.15, mn2gamma(2, 1)), rob2=c(0.15, ms2gamma(2, 5)), inf=c(0.7, 50, 10))




