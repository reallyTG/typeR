library(discretization)


### Name: chi2
### Title: Discretization using the Chi2 algorithm
### Aliases: chi2

### ** Examples

data(iris)
#---cut-points
chi2(iris,0.5,0.05)$cutp

#--discretized dataset using Chi2 algorithm
chi2(iris,0.5,0.05)$Disc.data



