library(MoEClust)


### Name: expert_covar
### Title: Account for extra variability in covariance matrices with expert
###   covariates
### Aliases: expert_covar
### Keywords: utility

### ** Examples

data(ais)
res   <- MoE_clust(ais[,3:7], G=2, gating= ~ BMI, expert= ~ sex,
                   network.data=ais, modelNames="EVE")

# Extract the variance object
res$parameters$variance

# Modify the variance object
expert_covar(res)



