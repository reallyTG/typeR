library(detectRUNS)


### Name: slidingRUNS.run
### Title: Main function to detect RUNS (ROHom/ROHet) using sliding windows
###   (a la Plink)
### Aliases: slidingRUNS.run

### ** Examples

# getting map and ped paths
genotypeFile <- system.file("extdata", "Kijas2016_Sheep_subset.ped", package = "detectRUNS")
mapFile <- system.file("extdata", "Kijas2016_Sheep_subset.map", package = "detectRUNS")
# calculating runs with sliding window approach
## Not run: 
##D # skipping runs calculation
##D runs <- slidingRUNS.run(genotypeFile, mapFile, windowSize = 15, threshold = 0.1,
##D minSNP = 15, ROHet = FALSE,  maxOppWindow = 1, maxMissWindow = 1, maxGap=10^6,
##D minLengthBps = 100000,  minDensity = 1/10000)
## End(Not run)
# loading pre-calculated data
runsFile <- system.file("extdata", "Kijas2016_Sheep_subset.sliding.csv", package="detectRUNS")
colClasses <- c(rep("character", 3), rep("numeric", 4)  )
runs <- read.csv2(runsFile, header = TRUE, stringsAsFactors = FALSE,
colClasses = colClasses)




