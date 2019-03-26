library(MVNBayesian)


### Name: MVN_FConditional
### Title: Calculate full conditional normal ditribution of MVN
### Aliases: MVN_FConditional
### Keywords: Full conditional distribution MVN distribution

### ** Examples

head(dataset1)
BPos <- MVN_BayesianPosteriori(dataset1, c(80,16,3))
BPos # Bayesian Posteriori
result <- MVN_FConditional(BPos, variable = 1, z=c(75, 13, 4))
result$mean
class(result$mean)
result$var
class(result$var)

# compare the following results:
MVN_FConditional(BPos, variable = 2, z=c(75, 13, 4))
MVN_FConditional(BPos, variable = 2, z=c(75, 88, 4))
MVN_FConditional(BPos, variable = 1, z=c(75, 88, 4))



