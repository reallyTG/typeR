library(RcppBlaze)


### Name: fastLmPure
### Title: linear model fitting function based on RcppBlaze
### Aliases: fastLmPure

### ** Examples

# according to fastLm example in RcppArmadillo
data(trees, package="datasets")
flm <- fastLmPure(cbind(1, log(trees$Girth)), log(trees$Volume), 0)
print(flm)



