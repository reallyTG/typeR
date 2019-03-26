library(DSpat)


### Name: simPts
### Title: Simulates point process on a rectangular grid
### Aliases: simPts

### ** Examples

hab.range=30
probs=c(1/3,2/3)
covariates = simCovariates(hab.range, probs)
xpp=simPts(covariates=covariates,int.formula=~factor(habitat),int.par=c(0,1,2))
plot(xpp)



