library(OpenMx)


### Name: mxPearsonSelCov
### Title: Perform Pearson Aitken selection
### Aliases: mxPearsonSelCov mxPearsonSelMean

### ** Examples

library(OpenMx)

m1 <- mxModel(
  'selectionTest',
  mxMatrix('Full', 10, 10, values=rWishart(1, 20, toeplitz((10:1)/10))[,,1],
           dimnames=list(paste0('c',1:10),paste0('c',1:10)), name="m1"),
  mxMatrix('Full', 2, 2, values=diag(2),
           dimnames=list(paste0('c',1:2),paste0('c',1:2)), name="m2"),
  mxMatrix('Full', 10, 1, values=runif(10),
           dimnames=list(paste0('c',1:10),c('v')), name="u1"),
  mxAlgebra(mxPearsonSelCov(m1, m2), name="c1"),
  mxAlgebra(mxPearsonSelMean(m1, m2, u1), name="u2")
)

m1 <- mxRun(m1)



