library(prabclus)


### Name: alleledist
### Title: Shared allele distance for diploid loci
### Aliases: alleledist
### Keywords: cluster

### ** Examples

  data(tetragonula)
  tnb <-
  coord2dist(coordmatrix=tetragonula.coord[1:50,],cut=50,file.format="decimal2",neighbors=TRUE)
  ta <- alleleconvert(strmatrix=tetragonula[1:50,])
  tai <- alleleinit(allelematrix=ta,neighborhood=tnb$nblist,distance="none")
  str(alleledist((unbuild.charmatrix(tai$charmatrix,50,13)),50,13)) 



