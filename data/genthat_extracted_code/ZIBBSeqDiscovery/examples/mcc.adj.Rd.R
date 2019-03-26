library(ZIBBSeqDiscovery)


### Name: mcc.adj
### Title: Using MCC method to replace NAs in the p values
### Aliases: mcc.adj

### ** Examples

## Load the data
## data.Y is a count matrix with 100 OTUs and 20 samples randomly selected  
##   from kostic data
data(data.Y)

## set random seed
set.seed(1)

## construct design matrix for count model
## data.X is a 20-by-2 matrix, phenotype is group, and the first 10 samples
##   come from group 1 and the rest samples come from group 2
data.X <- matrix(c(rep(1, 20), rep(0,10), rep(1, 10)), 20, 2)

## construct design matrix for zero model
## data.ziMatrix is a 20-by-2 matrix, the covariate is log of library size
data.ziMatrix <- matrix(1, 20, 2)
data.ziMatrix[, 2] <- log(colSums(data.Y))

## fit ZIBB with free approach
out.free <- fitZIBB(data.Y, data.X, data.ziMatrix, mode = "free")

## count how many NAs in the p values
sum(is.na(out.free$p))

## MCC adjustment
out.free.mcc <- mcc.adj(out.free, data.Y, data.X, data.ziMatrix, K=4)

## count how many NAs in the p values after MCC adjustment
sum(is.na(out.free.mcc$p))



