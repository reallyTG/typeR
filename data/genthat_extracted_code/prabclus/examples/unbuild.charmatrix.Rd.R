library(prabclus)


### Name: unbuild.charmatrix
### Title: Internal: create allele list out of character matrix
### Aliases: unbuild.charmatrix
### Keywords: manip

### ** Examples

  data(tetragonula)
  tnb <-
  coord2dist(coordmatrix=tetragonula.coord[1:50,],cut=50,file.format="decimal2",neighbors=TRUE)
  ta <- alleleconvert(strmatrix=tetragonula[1:50,])
  tai <- alleleinit(allelematrix=ta,neighborhood=tnb$nblist,distance="none")
  str(unbuild.charmatrix(tai$charmatrix,50,13)) 



