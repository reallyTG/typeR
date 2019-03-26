## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----loadBSL, message=FALSE----------------------------------------------
library(BreedingSchemeLanguage)

## ----deletePriorSim------------------------------------------------------
if (exists("simEnv")){
  rm(list=names(simEnv), envir=simEnv)
  rm(simEnv)
}

## ----pathToHapMap--------------------------------------------------------
filePathName <- system.file("extdata", "exampleHapMapFile.hmp", package = "BreedingSchemeLanguage")
simEnv <- defineSpecies(loadData=NULL, importFounderHap=filePathName, nMarkers=350)
initializePopulation(nInd=20) # Create Population 0, Cycle 0

## ----make families-------------------------------------------------------
selfFertilize() # Create Population 1, Cycle 1
phenotype()
select(nSelect=2, type="WithinFamily") # Create Population 2, Cycle 1
cross(notWithinFam=T) # Create Population 3, Cycle 2

## ----Repeat within-family selection scheme-------------------------------
phenotype()
select(nSelect=20) # Create Population 4, Cycle 2
selfFertilize() # Create Population 5, Cycle 3
phenotype()
select(nSelect=2, type="WithinFamily") # Create Population 6, Cycle 3
cross(notWithinFam=T) # Create Population 7, Cycle 4
plotData()
plotData(popID=list(0, 1, 2, 3, 4, 5, 6, 7))

