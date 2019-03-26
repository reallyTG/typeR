library(ptycho)


### Name: PosteriorStatistics
### Title: Extract Posterior Statistics
### Aliases: PosteriorStatistics meanTau varTau meanIndicators
###   meanVarIndicators meanGrpIndicators

### ** Examples

data(ptychoIn)
data(ptychoOut)
# Compare averages of sampled group indicator variables to truth.
cbind(ptychoIn$replicates[[1]]$indic.grp,
      meanGrpIndicators(ptychoOut))
# Compare averages of sampled covariate indicator variables to truth.
cbind(ptychoIn$replicates[[1]]$indic.var,
      meanVarIndicators(ptychoOut))
# Compare average of sampled values of tau to truth.
ptychoIn$replicates[[1]]$tau
meanTau(ptychoOut)
# Variance of sampled values of tau is reasonable because sampled model
# is usually NOT empty.
varTau(ptychoOut)



