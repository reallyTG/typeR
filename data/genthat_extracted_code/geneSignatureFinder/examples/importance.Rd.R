library(geneSignatureFinder)


### Name: importance
### Title: Compute an index of importance of the genes in the signature.
### Aliases: importance

### ** Examples

data(geNSCLC)
geData <- geNSCLC
data(stNSCLC)
stData <- stNSCLC
aMakeCluster <- makeCluster(2)
geneSeed <- which(colnames(geData) == "SELP")
signature <- signatureFinder(geneSeed, 
  cpuCluster = aMakeCluster, stopCpuCluster = FALSE)
signature <- importance(signature, cpuCluster = aMakeCluster)
signature
signature$importance
#################################
barplot(signature$importance, main = "Importance based on L1GeneOut",
        sub = paste("Signature starting from:", signature$startingSignature))



