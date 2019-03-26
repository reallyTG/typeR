library(geneSignatureFinder)


### Name: removeGeneFrom
### Title: Remove the gene with the lowest importance from a signature
### Aliases: removeGeneFrom

### ** Examples

data(geNSCLC)
geData <- geNSCLC
data(stNSCLC)
stData <- stNSCLC
# develop the signature
aMakeCluster <- makeCluster(2)
geneSeed <- which(colnames(geData) == "RNF5")
signature <- signatureFinder(geneSeed, cpuCluster = aMakeCluster,
                             stopCpuCluster = FALSE)
signature <- importance(signature, cpuCluster = aMakeCluster)
print(signature$importance)

################################
# 1 step pruning
removeGeneFrom(signature, cutoff = 0.3)$signature

##################################
# iterative pruning of the signature
signature
repeat {
  tmp <- removeGeneFrom(signature, cutoff = 0.3)
  if(is.null(tmp)) break
  signature <- tmp
}  
signature
signature$importance



