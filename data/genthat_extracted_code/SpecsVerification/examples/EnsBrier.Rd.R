library(SpecsVerification)


### Name: EnsBrier
### Title: Calculate the ensemble-adjusted Brier Score
### Aliases: EnsBrier FairBrier

### ** Examples

data(eurotempforecast)
mean(EnsBrier(ens.bin, obs.bin, R.new=Inf))



