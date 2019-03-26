library(SpecsVerification)


### Name: SqErr
### Title: Calculate the squared error between forecast and observation
### Aliases: SqErr

### ** Examples

data(eurotempforecast)
mean(SqErr(rowMeans(ens), obs))



