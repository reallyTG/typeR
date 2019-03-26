library(geneSignatureFinder)


### Name: searchResultsSummaryTable
### Title: Build a data frame populated with the results of a sequential
###   searching of signatures starting from a list of seed-genes.
### Aliases: searchResultsSummaryTable

### ** Examples

data(geNSCLC)
geData <- geNSCLC
data(stNSCLC)
stData <- stNSCLC

# CALCA = 152, SELP = 115
seedGenes <- c(152, 115)
K <- length(seedGenes)
searchResults <- vector("list", K)
names(searchResults) <- colnames(geData)[seedGenes]


aMakeCluster <- makeCluster(2)
for(k in 1:K) 
  searchResults[[k]] <- signatureFinder(seedGenes[k], 
    cpuCluster = aMakeCluster, stopCpuCluster = FALSE)
stopCluster(aMakeCluster)
searchResults
signaturesTable <- searchResultsSummaryTable(searchResults)
signaturesTable



