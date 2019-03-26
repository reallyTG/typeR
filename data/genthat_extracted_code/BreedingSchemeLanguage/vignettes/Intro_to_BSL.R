## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(fig.dpi=96)

## ----loadBSL-------------------------------------------------------------
library(BreedingSchemeLanguage)
simTempDir <- tempdir()

## ----defineSpecies-------------------------------------------------------
simEnv <- defineSpecies(nSim=3, saveDataFileName=paste(simTempDir, "simSpecies", sep="/"))

## ----defineVariances-----------------------------------------------------
locCor <- matrix(c(1, 0.6, 0.3, 
                   0.6, 1, 0.8, 
                   0.3, 0.8, 1)
                 , 3)
errVars <- c(Preliminary=4, Advanced=1)
defineVariances(locCorrelations=locCor, plotTypeErrVars=errVars)
plotCosts <- c(Preliminary=2, Advanced=5)
defineCosts(phenoCost=plotCosts)

## ----initialize----------------------------------------------------------
initializePopulation()

## ----firstEvaluation-----------------------------------------------------
phenotype(locations=1:3, years=1:2, plotType="Preliminary")
predictValue()
select()

## ----createEvaluateC1----------------------------------------------------
cross()
phenotype(plotType="Advanced", locations=3, years=3)
predictValue(sharingInfo="pedigree")
select()

## ----createC2bySelfingCreateC3-------------------------------------------
selfFertilize(nProgeny=120)
genotype()
predictValue(sharingInfo="markers", locations=3)
select()
cross()

## ------------------------------------------------------------------------
cycleMeans <- plotData(addDataFileName=paste(simTempDir, "simPlot", sep="/"))

## ----newSim--------------------------------------------------------------
if (exists("simEnv")){
rm(list=names(simEnv), envir=simEnv)
rm(simEnv)
}
simEnv <- defineSpecies(loadData=paste(simTempDir, "simSpecies", sep="/"))
initializePopulation()
phenotype()
select()
cross()
phenotype()
select()
cross()
phenotype()
select()
cross()
cycleMeans <- plotData(add=TRUE, addDataFileName=paste(simTempDir, "simPlot", sep="/"))

## ----cleanup-------------------------------------------------------------
fr <- file.remove(paste(simTempDir, "simSpecies.RData", sep="/"))
fr <- file.remove(paste(simTempDir, "simPlot.rds", sep="/"))

