library(RFLPtools)


### Name: simMatrix
### Title: Similarity matrix for BLAST data.
### Aliases: simMatrix
### Keywords: multivariate cluster

### ** Examples

data(BLASTdata)

## without sequence range
## code takes some time
## Not run: 
##D res <- simMatrix(BLASTdata)
## End(Not run)

## with sequence range
range(BLASTdata$alignment.length)
res1 <- simMatrix(BLASTdata, sequence.range = TRUE, Min = 100, Max = 450)
res2 <- simMatrix(BLASTdata, sequence.range = TRUE, Min = 500)



