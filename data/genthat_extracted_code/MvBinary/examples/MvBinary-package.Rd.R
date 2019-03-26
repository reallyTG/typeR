library(MvBinary)


### Name: MvBinary-package
### Title: MvBinary a package for Multivariate Binary data
### Aliases: MvBinary MvBinary-package
### Keywords: package

### ** Examples

# Package loading
rm(list=ls())
require(MvBinary)

# Data loading
data(MvBinaryExample)

# Parameter estimation by the HAC-based algorithm on 2 cores
# where the EM algorithms are initialized 10 times
res.CAH <- MvBinaryEstim(MvBinaryExample, 2, nbinit.EM = 10)

# Summary of the estimated model
summary(res.CAH)

# Print the parameters of the estimated model
print(res.CAH)



