library(mvabund)


### Name: deviance.manylm
### Title: Model Deviance
### Aliases: deviance.manylm
### Keywords: models multivariate

### ** Examples

data(spider)
spiddat <- mvabund(spider$abund)
X <- spider$x

## Calculate the deviance:
deviance(manylm(spiddat~X))



