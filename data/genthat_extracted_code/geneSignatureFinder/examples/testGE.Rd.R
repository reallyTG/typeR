library(geneSignatureFinder)


### Name: testGE
### Title: Test the differential expression of the the genes in a signature
###   with respect to the good and poor prognosis groups.
### Aliases: testGE

### ** Examples

# find the signature starting from the gene SELP for  the Non Small Cell Lung Cancer 
# set the working data 
data(geNSCLC)
geData <- geNSCLC
data(stNSCLC)
stData <- stNSCLC
# set the dimension of the cpu's cluster 
# (use a value different from 2 depending on the number of cpu avalilable)
aMakeCluster <- makeCluster(2)
# set the starting gene to SELP
geneSeed <- which(colnames(geData) == "SELP")
# run ...
ans <- signatureFinder(geneSeed, logFilePrefix = "test", 
		cpuCluster = aMakeCluster, stopCpuCluster = FALSE)
ans
ans <- testGE(ans, cpuCluster = aMakeCluster)
ans$groupMean
ans$meanDifferencePValue
#####################
#library(gplots)
#barplot2(t(ans$groupMean), beside = TRUE,
#                   main = paste("Signature starting from:", ans$startingSignature),
#                   legend = paste(colnames(ans$groupMedian), "prognosis group"))



