library(circular)


### Name: mixedvonmises
### Title: Mixture of von Mises Distributions
### Aliases: dmixedvonmises rmixedvonmises pmixedvonmises
### Keywords: distribution

### ** Examples


x <- rmixedvonmises(n=100, mu1=circular(0), mu2=circular(pi), kappa1=15, 
  kappa2=15, prop=0.5)
plot(x)





