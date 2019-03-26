library(CovTools)


### Name: CovDist
### Title: Compute Pairwise Distance for Symmetric Positive-Definite
###   Matrices
### Aliases: CovDist

### ** Examples

## generate 100 SPD matrices of size (5-by-5)
samples = samplecovs(100,5)

## get pairwise distance for "AIRM"
distAIRM = CovDist(samples, method="AIRM")

## dimension reduction using MDS
ss = cmdscale(distAIRM)
plot(ss[,1],ss[,2],main="2d projection")




