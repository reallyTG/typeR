library(ZIBBSeqDiscovery)


### Name: fitZIBB
### Title: The main function to fit ZIBB model
### Aliases: fitZIBB
### Keywords: fitZIBB

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

## fit ZIBB with constrained approach
out.constrained <- fitZIBB(data.Y, data.X, data.ziMatrix, 
                           mode = "constrained", gn = 3, 
                           betastart = out.free$betahat, 
                           psi.start = out.free$psi, 
                           eta.start = out.free$zeroCoef)

## print OTUs which has p values smaller than 0.05
out.constrained$p[which(out.constrained$p < 0.05)]



