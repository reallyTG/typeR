library(norm2)


### Name: summary.norm
### Title: Summarize information from EM or MCMC algorithms
### Aliases: summary.norm print.summary.norm
### Keywords: multivariate NA

### ** Examples

## run EM for cholesterol data and summarize
data(cholesterol)
emResult <- emNorm(cholesterol)
summary(emResult)

## run MCMC starting from the ML estimates and summarize
mcmcResult <- mcmcNorm(emResult)
summary(mcmcResult)



