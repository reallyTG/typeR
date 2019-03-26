library(detectRUNS)


### Name: consecutiveRUNS.run
### Title: Main function to detect genomic RUNS (ROHom/ROHet) using the
###   consecutive method
### Aliases: consecutiveRUNS.run

### ** Examples

# getting map and ped paths
genotypeFile <- system.file("extdata", "Kijas2016_Sheep_subset.ped", package = "detectRUNS")
mapFile <- system.file("extdata", "Kijas2016_Sheep_subset.map", package = "detectRUNS")
# calculating runs with consecutive run approach
## Not run: 
##D # skipping runs calculation
##D runs <- consecutiveRUNS.run(genotypeFile, mapFile, minSNP = 15, ROHet = FALSE,
##D maxOppRun = 0, maxMissRun = 0, maxGap=10^6,
##D minLengthBps = 100000)
## End(Not run)
# loading pre-calculated data
runsFile <- system.file("extdata", "Kijas2016_Sheep_subset.consecutive.csv", package="detectRUNS")
colClasses <- c(rep("character", 3), rep("numeric", 4)  )
runs <- read.csv2(runsFile, header = TRUE, stringsAsFactors = FALSE,
colClasses = colClasses)




