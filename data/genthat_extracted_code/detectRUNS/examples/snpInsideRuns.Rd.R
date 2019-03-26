library(detectRUNS)


### Name: snpInsideRuns
### Title: Function to count number of times a SNP is in a RUN
### Aliases: snpInsideRuns

### ** Examples

# getting map and ped paths
genotypeFile <- system.file("extdata", "Kijas2016_Sheep_subset.ped", package = "detectRUNS")
mapFile <- system.file("extdata", "Kijas2016_Sheep_subset.map", package = "detectRUNS")

# defining mapChrom
mappa <- data.table::fread(mapFile, header = FALSE)
names(mappa) <- c("CHR","SNP_NAME","x","POSITION")
mappa$x <- NULL
chrom <- "24"
mapChrom <- mappa[mappa$CHR==chrom, ]

# calculating runs of Homozygosity
## Not run: 
##D # skipping runs calculation
##D runs <- slidingRUNS.run(genotypeFile, mapFile, windowSize = 15, threshold = 0.1,  minSNP = 15,
##D ROHet = FALSE,  maxOppositeGenotype = 1, maxMiss = 1,  minLengthBps = 100000,  minDensity = 1/10000)
## End(Not run)
# loading pre-calculated data
runsFile <- system.file("extdata", "Kijas2016_Sheep_subset.sliding.csv", package="detectRUNS")
colClasses <- c(rep("character", 3), rep("numeric", 4)  )
runs <- read.csv2(runsFile, header = TRUE, stringsAsFactors = FALSE,
colClasses = colClasses)

# fix column names and define runsChrom
names(runs) <- c("POPULATION","IND","CHROMOSOME","COUNT","START","END","LENGTH")
runsChrom <- runs[runs$CHROMOSOME==chrom, ]

snpInsideRuns(runsChrom, mapChrom, genotypeFile)




