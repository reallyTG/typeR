library(plsRbeta)


### Name: tilt.bootplsbeta
### Title: Tilted bootstrap for PLS models
### Aliases: tilt.bootplsbeta
### Keywords: models

### ** Examples
## No test: 
data("GasolineYield",package="betareg")

GazYield.tilt.boot <- tilt.bootplsbeta(plsRbeta(yield~.,data=GasolineYield,nt=3,
modele="pls-beta"), statistic=coefs.plsRbeta, R=c(499, 100, 100), 
alpha=c(0.025, 0.975), sim="balanced", stype="i", index=1)
boxplots.bootpls(GazYield.tilt.boot,1:2)

## End(No test)



