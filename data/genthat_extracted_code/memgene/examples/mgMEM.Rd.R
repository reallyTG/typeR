library(memgene)


### Name: mgMEM
### Title: Extraction of MEM eigenvectors given distances among sampling
###   locations
### Aliases: mgMEM

### ** Examples


## Prepare the radial data for analysis
radialData <- read.csv(system.file("extdata/radial.csv", package="memgene"))
radialXY <- radialData[, 1:2]

## Find MEM eigenvectors given sampling locations
## by first finding the Euclidean distance matrix
radialEuclid <- dist(radialXY)
radialMEM <- mgMEM(radialEuclid)




