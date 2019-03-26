library(OBRE)


### Name: OBRE
### Title: Optimal B-Robust Estimator
### Aliases: OBRE

### ** Examples

# Using the densityExpressions function for initialize the distribution
distrForOBRE <- densityExpressions(strDistribution = "normal")
simData = c(rnorm(1000, 12, 2),200,150)
## No test: 
estOBRE <- OBRE(nvData = simData, strDistribution = distrForOBRE, nCParOBRE = 3)
# Launching the generation of the density expression directly from OBRE
simData = c(rnorm(1000, 12, 2),200,150)
estOBRE <- OBRE(nvData = simData, strDistribution = "normal", nCParOBRE = 3)
# Using the "custom" option and using the normal distribution
simData = c(rnorm(1000, 12, 2),200,150)
estOBRE <- OBRE(nvData = simData, strDistribution = "custom", nCParOBRE = 3,
eDensityFun = expression((exp( -((nvData - nTheta1)^2) / (2 * nTheta2^2)) /
(sqrt(2 * pi) * nTheta2))))
## End(No test)




