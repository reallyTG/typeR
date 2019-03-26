library(prabclus)


### Name: allele2zeroone
### Title: Converts alleleobject into binary matrix
### Aliases: allele2zeroone
### Keywords: manip

### ** Examples

  data(tetragonula)
  ta <- alleleconvert(strmatrix=tetragonula[21:50,])
  tai <- alleleinit(allelematrix=ta)
  allele2zeroone(tai)



