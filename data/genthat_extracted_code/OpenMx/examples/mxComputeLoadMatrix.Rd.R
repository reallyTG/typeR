library(OpenMx)


### Name: mxComputeLoadMatrix
### Title: Load data from CSV files directly into the backend
### Aliases: mxComputeLoadMatrix MxComputeLoadMatrix-class

### ** Examples

library(OpenMx)

Cov <- rWishart(4, 20, toeplitz(c(2,1)/20))
write.table(t(apply(Cov, 3, vech)),
            file="cov.csv", col.names=FALSE, row.names=FALSE)
Mean <- matrix(rnorm(8),4,2)
write.table(Mean, file="mean.csv", col.names=FALSE, row.names=FALSE)

m1 <- mxModel(
  "test1",
  mxMatrix("Full", 1,2, values=0,       name="mean"),
  mxMatrix("Symm", 2,2, values=diag(2), name="cov"),
  mxMatrix("Full", 1,2, values=-1,      name="lbound"),
  mxMatrix("Full", 1,2, values=1,       name="ubound"),
  mxAlgebra(omxMnor(cov,mean,lbound,ubound), name="area"),
  mxFitFunctionAlgebra("area"),
  mxComputeLoop(list(
    mxComputeLoadMatrix(c('mean', 'cov'),
                        c('mean.csv', 'cov.csv')),
    mxComputeOnce('fitfunction', 'fit'),
    mxComputeCheckpoint(path="loadMatrix.csv")
  ), i=1:4))

m1 <- mxRun(m1)



