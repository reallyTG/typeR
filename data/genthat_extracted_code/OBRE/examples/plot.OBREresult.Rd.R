library(OBRE)


### Name: plot.OBREresult
### Title: Function that plot an OBREresult object.
### Aliases: plot.OBREresult

### ** Examples

## No test: 
# Generates the Normal distribution input for OBRE
distrForOBRE <- densityExpressions(strDistribution = "normal")
# Generates input data
simData = c(rnorm(100, 12, 1), rnorm(10, 10, 10))
# Estimates OBREresult object
estOBRE = OBRE(nvData = simData, strDistribution = "normal", nCParOBRE = 3)
plot(estOBRE)
## End(No test)




