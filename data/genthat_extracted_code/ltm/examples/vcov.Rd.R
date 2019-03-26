library(ltm)


### Name: vcov
### Title: vcov method for fitted IRT models
### Aliases: vcov.gpcm vcov.grm vcov.ltm vcov.rasch vcov.tpm
### Keywords: methods

### ** Examples

fit <- rasch(WIRS)
vcov(fit)
sqrt(diag(vcov(fit))) # standard errors under additive parameterization



