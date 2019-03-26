library(heemod)


### Name: mix
### Title: Mix Two or More Survival Distributions
### Aliases: mix mix_ pool pool_

### ** Examples


dist1 <- define_survival(distribution = "exp", rate = .5)
dist2 <- define_survival(distribution = "gompertz", rate = .5, shape = 1)
pooled_dist <- mix(dist1, dist2, weights = c(0.25, 0.75))




