library(rnaseqWrapper)


### Name: calcHornMatrix
### Title: Calculate a Horn distance matrix
### Aliases: calcHornMatrix

### ** Examples


## Only run if DESeq is available
if(require(DESeq)){

## Create sample counts
## Thes could be the reads or FPKM from input data instead
require(DESeq)
exampleCounts <- counts(makeExampleCountDataSet())

testHorn <- calcHornMatrix(exampleCounts)
head(testHorn)


## Plot the results
distMat <-as.dist( (1-testHorn), diag=FALSE, upper=FALSE)

# scores to plot MDS (ecodist)
scores_ADNA <-nmds(distMat, mindim=2, maxdim=2) 
scores_ADNA <- nmds.min(scores_ADNA)

# Set colors to match treatments
treatCol <- c("red","red","blue","blue","blue")

plot(scores_ADNA[,1:2],pch=19,col=treatCol)

}




