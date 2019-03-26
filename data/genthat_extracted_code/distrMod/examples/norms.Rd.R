library(distrMod)


### Name: norm
### Title: Norm functions
### Aliases: EuclideanNorm QuadFormNorm
### Keywords: robust

### ** Examples

mm <- matrix(rnorm(20),2,10)
EuclideanNorm(mm)
QuadFormNorm(mm, A = PosSemDefSymmMatrix(matrix(c(3,1,1,1),2,2)))



