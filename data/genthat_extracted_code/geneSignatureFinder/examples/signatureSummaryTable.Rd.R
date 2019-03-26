library(geneSignatureFinder)


### Name: signatureSummaryTable
### Title: Build a data frame populated with the basic information of a
###   signature.
### Aliases: signatureSummaryTable

### ** Examples

data(geNSCLC)
geData <- geNSCLC
data(stNSCLC)
stData <- stNSCLC
# set the dimension of the cpu's cluster (use a value different from 2 
# depending on the number of cpu avalilable)
aMakeCluster <- makeCluster(2)
signature <- signatureFinder(which(colnames(geData) == "HIF1a"),
  cpuCluster = aMakeCluster)
signature <- importance(signature)
signature <- testGE(signature)
signatureTable <- signatureSummaryTable(signature)
print(signatureTable)



