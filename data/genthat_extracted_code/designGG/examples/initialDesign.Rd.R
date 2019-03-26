library(designGG)


### Name: initialDesign
### Title: Initialize an experiment design matrix
### Aliases: initialDesign
### Keywords: method

### ** Examples

library(designGG)
data(genotype)
nRILs <-100
nEnvFactors <- 2  
nConditions <-2
nLevels <- c( 2, 2 )
levels <- list ( c(16, 24), c(5, 10) )
nSlides <- 100
nTuple <- 25  
bTwoColorArray <- TRUE 
initialDesign( genotype, nRILs, nSlides, nConditions, nTuple, bTwoColorArray )          



