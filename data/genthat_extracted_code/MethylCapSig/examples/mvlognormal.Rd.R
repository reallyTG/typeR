library(MethylCapSig)


### Name: mvlognormal
### Title: Multivariate lognormal random variable generator.
### Aliases: mvlognormal

### ** Examples

## Generate 10 samples with dimension 20.
X <- mvlognormal(n = 10, Mu = runif(20, 0, 1), 
      Sigma = rep(2, 20), R = toeplitz(0.5^(0:19)));



