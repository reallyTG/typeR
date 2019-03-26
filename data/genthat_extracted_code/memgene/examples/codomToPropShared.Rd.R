library(memgene)


### Name: codomToPropShared
### Title: Find proportion of shared alleles genetic distances from a
###   codominant alleles matrix
### Aliases: codomToPropShared

### ** Examples


radialData <- read.csv(system.file("extdata/radial.csv", package="memgene"))
radialGen <- radialData[, -c(1,2)]
radialDM <- codomToPropShared(radialGen)




