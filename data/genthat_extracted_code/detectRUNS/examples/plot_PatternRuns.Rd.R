library(detectRUNS)


### Name: plot_PatternRuns
### Title: Plot sum of run-lengths (or average run-lengths) against the
###   number of runs per individual
### Aliases: plot_PatternRuns

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

plot_PatternRuns(runs = runsDF, mapFile = mapFile, method = 'sum')
plot_PatternRuns(runs = runsDF, mapFile = mapFile, method = 'mean')




