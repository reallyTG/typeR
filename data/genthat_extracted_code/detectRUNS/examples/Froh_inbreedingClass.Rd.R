library(detectRUNS)


### Name: Froh_inbreedingClass
### Title: Function to calculated Froh using a ROH-class
### Aliases: Froh_inbreedingClass

### ** Examples

# getting map and ped paths
genotypeFile <- system.file("extdata", "Kijas2016_Sheep_subset.ped", package = "detectRUNS")
mapFile <- system.file("extdata", "Kijas2016_Sheep_subset.map", package = "detectRUNS")

# calculating runs of Homozygosity
## Not run: 
##D # skipping runs calculation
##D runs <- slidingRUNS.run(genotypeFile, mapFile, windowSize = 15, threshold = 0.1,  minSNP = 15,
##D ROHet = FALSE,  maxOppositeGenotype = 1, maxMiss = 1,  minLengthBps = 100000,  minDensity = 1/10000)
## End(Not run)
# loading pre-calculated data
runsFile <- system.file("extdata", "Kijas2016_Sheep_subset.sliding.csv", package="detectRUNS")
runsDF <- readExternalRuns(inputFile = runsFile, program = 'detectRUNS')

Froh_inbreedingClass(runs = runsDF, mapFile = mapFile, Class = 2)




