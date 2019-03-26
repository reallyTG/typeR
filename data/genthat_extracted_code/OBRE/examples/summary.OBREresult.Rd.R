library(OBRE)


### Name: summary.OBREresult
### Title: Function that summarize the results contained in an OBREresult
###   object.
### Aliases: summary.OBREresult

### ** Examples

## No test: 
# Generates the Normal distribution input for OBRE
distrForOBRE <- densityExpressions(strDistribution = "normal")
# Generates input data
simData = c(rnorm(100, 12, 1), rnorm(10, 10, 10))
# Estimates OBREresult object
estOBRE <- OBRE(nvData = simData, strDistribution = distrForOBRE, nCParOBRE = 3)
# Summary of the results
summary(estOBRE)
## End(No test)




