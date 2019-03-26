library(spaMM)


### Name: Poisson
### Title: Family function for GLMs and mixed models with Poisson and
###   zero-truncated Poisson response.
### Aliases: Poisson Tpoisson
### Keywords: models regression

### ** Examples

data("scotlip")
logLik(glm(I(1+cases)~1,family=Tpoisson(),data=scotlip))
logLik(fitme(I(1+cases)~1+(1|id),family=Tpoisson(),fixed=list(lambda=1e-8),data=scotlip))



