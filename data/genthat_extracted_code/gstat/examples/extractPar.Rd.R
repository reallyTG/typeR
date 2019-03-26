library(gstat)


### Name: extractPar
### Title: Extracting parameters and their names from a spatio-temporal
###   variogram model
### Aliases: extractPar extractParNames

### ** Examples

sumMetricModel <- vgmST("sumMetric",
                        space=vgm(30, "Sph", 200,  6),
                        time =vgm(30, "Sph",  15,  7),
                        joint=vgm(60, "Exp",  84, 22),
                        stAni=100)

extractPar(sumMetricModel)
extractParNames(sumMetricModel)



