library(SpecsVerification)


### Name: AbsErr
### Title: Calculate the absolute error between forecast and observation
### Aliases: AbsErr

### ** Examples

data(eurotempforecast)
mean(AbsErr(rowMeans(ens), obs))



