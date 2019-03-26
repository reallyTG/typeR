library(BreedingSchemeLanguage)


### Name: defineSpecies
### Title: Define and create species
### Aliases: defineSpecies

### ** Examples

if (exists("simEnv")){
rm(list=names(simEnv), envir=simEnv)
rm(simEnv)
}
simEnv <- defineSpecies(nSim=2, nChr=5, lengthChr=100, effPopSize=20, nMarkers=100, nQTL=10)
initializePopulation(nInd=50) # popID 0 created
phenotype()
select(nSelect=20) # popID 1 selected out of popID 0
cross() # popID 2 created
phenotype(nRep=2)
select(nSelect=5) # popID 3 selected out of popID 2
cross() # popID 4 created
plotData()




