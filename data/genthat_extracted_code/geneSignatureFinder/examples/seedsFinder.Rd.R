library(geneSignatureFinder)


### Name: seedsFinder
### Title: Evaluate some statistics on all genes in order to select those
###   that can be used as seeds for searching the signatures.
### Aliases: seedsFinder

### ** Examples

data(geNSCLC)
geData <- geNSCLC

data(stNSCLC)
stData <- stNSCLC

# here few genes and samples are considered to speed up the timing of the example.
# please, try 
# genesToUse <- which(apply(!is.na(geData), 2, sum)/nrow(geData) > 0.75)
# geData <- geData[, genesToUse]
# and comment stData <- stData[1:50, ]
genesToUse <- which(apply(!is.na(geData), 2, sum) == nrow(geData))
geData <- geData[, genesToUse]
geData <- geData[1:50, ]
stData <- stData[1:50, ]
dim(geData)

aMakeCluster <- makeCluster(2)
aSeedsFinder <- seedsFinder(cpuCluster = aMakeCluster)
head(aSeedsFinder)



