library(prabclus)


### Name: alleleinit
### Title: Diploid loci matrix initialization
### Aliases: alleleinit alleleobject print.alleleobject
### Keywords: spatial cluster manip

### ** Examples

# Only 50 observations are used in order to have a fast example.
  data(tetragonula)
  tnb <-
  coord2dist(coordmatrix=tetragonula.coord[1:50,],cut=50,file.format="decimal2",neighbors=TRUE)
  ta <- alleleconvert(strmatrix=tetragonula[1:50,])
  tai <- alleleinit(allelematrix=ta,neighborhood=tnb$nblist)
  print(tai)



