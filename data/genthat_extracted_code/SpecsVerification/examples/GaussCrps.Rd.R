library(SpecsVerification)


### Name: GaussCrps
### Title: Calculate the Continuous Ranked Probability Score (CRPS) for
###   forecasts issued as Normal distributions
### Aliases: GaussCrps

### ** Examples

data(eurotempforecast)
mean <- rowMeans(ens)
sd <- apply(ens, 1, sd)
mean(GaussCrps(mean, sd, obs))



