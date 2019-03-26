library(MVNBayesian)


### Name: MVN_BayesianPosteriori
### Title: Calculate Bayesian posteriori MVN distribution
### Aliases: MVN_BayesianPosteriori
### Keywords: Bayesian posteriori MVN distribution

### ** Examples

# Demo using dataset1:
head(dataset1)
BPos <- MVN_BayesianPosteriori(dataset1, c(80,16,3))
BPos$mean
BPos$var

# Singular system caused by insufficient data
eigen(var(dataset1[1:3,]))$values
rcond(var(dataset1[1:3,]))
eigen(var(dataset1[1:6,]))$values
rcond(var(dataset1[1:6,]))

# Singular system caused by improper degree of freedom
K <- cbind(dataset1, dataset1[,3]*(-2)+3)
eigen(var(K[,2:4]))$values
rcond(var(K[,2:4]))



