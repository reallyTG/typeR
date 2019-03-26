library(Crossover)


### Name: contrMat2
### Title: Create the design matrix, variance-covariance matrix, the
###   variance of each pairwise comparison and the efficicency of each
###   pairwise comparison for a cross-over design
### Aliases: contrMat2
### Keywords: misc

### ** Examples


contrMat2("Tukey", v=3, model=1)
contrMat2("Dunnett", v=3, model=1)
contrMat2(c("Dunnett", "Dunnett"), v=3, model=1)
contrMat2(c("Dunnett", "none"), v=3, model=1)
contrMat2(c("Dunnett", "none", "none"), v=3, model=8)
contrMat2("Dunnett", v=3, model=1, eff.factor=c(0.9, 0.1))
contrMat2("Dunnett", v=3, model=8, eff.factor=c(0.5, 0.3, 0.2))




