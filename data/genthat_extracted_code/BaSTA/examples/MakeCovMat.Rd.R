library(BaSTA)


### Name: MakeCovMat
### Title: Function to build a matrix of covariates (i.e. design matrix)
###   for a Bayesian Survival Trajectory Analysis (BaSTA) analysis.
### Aliases: MakeCovMat

### ** Examples

## Simulated sex and weight data for 5 individuals:
sex        <- sample(c("f", "m"), 5, replace = TRUE)
weight     <- rnorm(5, mean = 10, sd = 1)
raw.mat    <- data.frame(sex, weight)
new.mat    <- MakeCovMat(~sex + weight, data = raw.mat)



