library(detectRUNS)


### Name: readExternalRuns
### Title: Read runs from external files
### Aliases: readExternalRuns

### ** Examples

# getting map and ped paths
## Not run: 
##D genotypeFile <- system.file("extdata", "Kijas2016_Sheep_subset.ped", package = "detectRUNS")
##D mapFile <- system.file("extdata", "Kijas2016_Sheep_subset.map", package = "detectRUNS")
##D 
##D # calculating runs of Homozygosity
##D runs <- slidingRUNS.run(genotypeFile, mapFile, windowSize = 15, threshold = 0.1,  minSNP = 15,
##D ROHet = FALSE,  maxMissRun = 1, maxMissWindow = 1,  minLengthBps = 100000,  minDensity = 1/10000)
##D 
##D write.table(x= runs,file = 'RunsFileTest.txt', quote=F, row.names = F)
##D newData=readRunsFromFile(runsFile = 'RunsFileTest.txt', program = 'detectRUNS')
## End(Not run)




