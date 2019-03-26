library(BinOrdNonNor)


### Name: genBinOrdNN
### Title: Generates a data set with binary, ordinal and continuous
###   variables
### Aliases: genBinOrdNN

### ** Examples

## Not run:
set.seed(54321)
no.bin <- 1
no.ord <- 1
no.NN <- 4
q <- no.bin + no.ord + no.NN

marginal <- list(0.4, cumsum(c(0.4, 0.2, 0.3)))

skewness.vec <- c(2,0,-0.4677,0.6325)
kurtosis.vec <- c(6,-0.5455,-0.3750,0.6)

corr.mat <- matrix(c(1.0,-0.3,-0.3,-0.3,-0.3,-0.3,
                    -0.3, 1.0,-0.3,-0.3,-0.3,-0.3,
                    -0.3,-0.3, 1.0, 0.4, 0.5, 0.6,
                    -0.3,-0.3, 0.4, 1.0, 0.7, 0.8,
                    -0.3,-0.3, 0.5, 0.7, 1.0, 0.9,
                    -0.3,-0.3, 0.6, 0.8, 0.9, 1.0),
                    q,byrow=TRUE)

corr.mat.star <- cmat.star.BinOrdNN(plist=marginal, skew.vec=skewness.vec, 
kurto.vec=kurtosis.vec, no.bin=1, no.ord=1, no.NN=4, CorrMat=corr.mat)

sim.data <- genBinOrdNN(n=100000, plist=marginal, mean.vec=c(2,3,4,5), 
var.vec=c(3,5,10,20), skew.vec=skewness.vec, kurto.vec=kurtosis.vec,
no.bin=1, no.ord=1, no.NN=4, cmat.star=corr.mat.star) 

## End(Not run)



