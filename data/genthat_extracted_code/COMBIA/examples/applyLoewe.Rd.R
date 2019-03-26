library(COMBIA)


### Name: applyLoewe
### Title: This function calculates Loewe synergy/antagonism and associated
###   BIs
### Aliases: applyLoewe

### ** Examples

## Not run: 
##D dataFile <- system.file("extdata", "rawDataPreProcessed.csv", package="COMBIA")
##D dataSample <- read.csv(dataFile, header=FALSE )
##D xConc  <- c(0.00,  0.20,  0.39,  0.78,  1.56,3.12,  6.25, 12.50, 25.00, 50) 
##D yConc <- c(128,  64,  32,  16,   8,   4,   2,   0)
##D noOFBoot <- 500 # a large number is recomended
##D rslt <- applyLoewe(as.matrix(dataSample), xConc, yConc, noOFBoot)
## End(Not run)



