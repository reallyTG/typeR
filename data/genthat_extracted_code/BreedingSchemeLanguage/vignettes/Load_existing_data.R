## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(fig.dpi = 96)
knitr::opts_chunk$set(echo = TRUE)

## ----loadBSL, message=FALSE----------------------------------------------
library(BreedingSchemeLanguage)

## ----deletePriorSim------------------------------------------------------
if (exists("simEnv")){
  rm(list=names(simEnv), envir=simEnv)
  rm(simEnv)
}

## ----pathToHapMap--------------------------------------------------------
filePathName <- system.file("extdata", "exampleHapMapFile.hmp", package = "BreedingSchemeLanguage")

## ----displayHapMap, echo=FALSE, include=TRUE-----------------------------
hapmap <- readLines(con=filePathName)
hapmap[11] <- ""
for (i in 1:11)
  cat(paste(substr(hapmap[i], 1, 83), "..."), "\n")

## ----defineSpecies-------------------------------------------------------
simEnv <- defineSpecies(loadData=NULL, importFounderHap=filePathName, nChr=5, lengthChr=100, nMarkers=300)
initializePopulation()

## ----selectionFounders---------------------------------------------------
phenotype()
genotype()
predictValue()
select(nSelect=50)
cross(equalContribution=T)

## ----genomicSelection----------------------------------------------------
genotype()
predictValue()
select(nSelect=5)
cross()
cycleMeans <- plotData()

