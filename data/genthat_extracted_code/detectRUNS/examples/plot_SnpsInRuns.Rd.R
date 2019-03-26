library(detectRUNS)


### Name: plot_SnpsInRuns
### Title: Plot the number of times each SNP falls inside runs
### Aliases: plot_SnpsInRuns

### ** Examples

# getting map and ped paths
genotypeFile <- system.file("extdata", "Kijas2016_Sheep_subset.ped", package = "detectRUNS")
mapFile <- system.file("extdata", "Kijas2016_Sheep_subset.map", package = "detectRUNS")

# calculating runs of Homozygosity
# skipping runs calculation
## Not run: 
##D runs <- slidingRUNS.run(genotypeFile, mapFile, windowSize = 15, threshold = 0.1,  minSNP = 15,
##D ROHet = FALSE,  maxOppositeGenotype = 1, maxMiss = 1,  minLengthBps = 100000,  minDensity = 1/10000)
## End(Not run)
# loading pre-calculated data
runsFile <- system.file("extdata", "Kijas2016_Sheep_subset.sliding.csv", package="detectRUNS")
runsDF <- readExternalRuns(inputFile = runsFile, program = 'detectRUNS')

# plot runs per animal (interactive)
plot_SnpsInRuns(runs = runsDF, genotypeFile = genotypeFile, mapFile = mapFile,
savePlots = FALSE, outputName = "ROHom")




