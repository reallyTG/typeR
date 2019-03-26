library(geneSignatureFinder)


### Name: signatureFinder
### Title: Main function to find the signature.
### Aliases: signatureFinder

### ** Examples

# find the signature starting from the gene SELP for the Non Small Cell Lung Cancer 
#############
# set the working data 
data(geNSCLC)
geData <- geNSCLC
data(stNSCLC)
stData <- stNSCLC
##############
# set the dimension of the cpu's cluster 
aMakeCluster <- makeCluster(2)
################
# set the starting gene to SELP
geneSeed <- which(colnames(geData) == "SELP")
##################
# run ...
ans <- signatureFinder(geneSeed, cpuCluster = aMakeCluster)
ans



