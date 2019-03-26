library(OBRE)


### Name: OBRECovarianceMatrix
### Title: Function that computes the OBRE covariance matrix.
### Aliases: OBRECovarianceMatrix

### ** Examples

## No test: 
distrForOBRE <- densityExpressions(strDistribution = "normal")
simData = c(rnorm(1000, 12, 2),200,150)
estOBRE <- OBRE(nvData = simData, strDistribution = distrForOBRE, nCParOBRE = 3)
lOBRECov = OBRECovarianceMatrix(estOBRE)
## End(No test)




