library(gamlss.mx)


### Name: gamlssNP
### Title: A function to fit finite mixtures using the gamlss family of
###   distributions
### Aliases: gamlssNP
### Keywords: regression

### ** Examples

data(enzyme)
# equivalent model using gamlssNP
mmNP1 <- gamlssNP(act~1, data=enzyme, random=~1,family=NO, K=2)
mmNP2 <- gamlssNP(act~1, data=enzyme, random=~1, sigma.fo=~MASS, family=NO, K=2)
AIC(mmNP1, mmNP2)



