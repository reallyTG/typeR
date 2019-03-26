library(rotations)


### Name: region
### Title: Confidence and credible regions for the central orientation
### Aliases: region region.Q4 region.SO3

### ** Examples

Rs <- ruars(20, rvmises, kappa = 10)

#Compare the region sizes that are currently available

region(Rs, method = "transformation", type = "asymptotic", estimator = "mean", alp = 0.1)
region(Rs, method = "transformation", type = "bootstrap", estimator = "mean",
alp = 0.1, symm = TRUE)
region(Rs, method = "direct", type = "bootstrap", estimator = "mean", alp = 0.1, m = 100)
region(Rs, method = "direct", type = "asymptotic", estimator = "mean", alp = 0.1)
## Not run: 
##D region(Rs, method = "Bayes", type = "Mises", estimator = "mean",
##D        S0 = mean(Rs), kappa0 = 10, tuneS = 5000, tuneK = 1, burn_in = 1000, alp = .01, m = 5000)
## End(Not run)



