library(RefFreeEWAS)


### Name: RefFreeCellMix
### Title: Reference-Free Cell Mixture Projection
### Aliases: RefFreeCellMix

### ** Examples

data(HNSCC)

# Typical use
Y.shortTest <- Y.HNSCC.averageBetas[1:500,]
Y.shortTest.final <- Y.HNSCC.averageBetas[1:1000,]
testArray1  <- RefFreeCellMixArray(Y.shortTest,Klist=1:3,iters=5,Yfinal=Y.shortTest.final)
testArray1
lapply(testArray1,summary)
sapply(testArray1,deviance,Y=Y.shortTest.final)

# Example with explicit initialization
testKeq2  <- RefFreeCellMix(Y.shortTest, mu0=RefFreeCellMixInitialize(Y.shortTest,K=2))
testKeq2
head(testKeq2$Mu)
head(testKeq2$Omega)



