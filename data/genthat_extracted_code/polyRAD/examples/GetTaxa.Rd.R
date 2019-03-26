library(polyRAD)


### Name: Accessors
### Title: Accessor Functions for RADdata Objects
### Aliases: GetTaxa GetLoci GetLocDepth GetContamRate SetContamRate nTaxa
###   nLoci nAlleles GetAlleleNames
### Keywords: methods utilities

### ** Examples

data(exampleRAD)
GetTaxa(exampleRAD)
GetLoci(exampleRAD)
GetLocDepth(exampleRAD)
GetContamRate(exampleRAD)
exampleRAD <- SetContamRate(exampleRAD, 0.0000001)
GetContamRate(exampleRAD)
nTaxa(exampleRAD)
nAlleles(exampleRAD)
GetAlleleNames(exampleRAD)



