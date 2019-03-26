library(prabclus)


### Name: stressvals
### Title: Stress values for different dimensions of Kruskal's MDS
### Aliases: stressvals
### Keywords: multivariate

### ** Examples

  options(digits=4)
  data(tetragonula)
  set.seed(112233)
  taiselect <- sample(236,40)
# Use data subset to make execution faster.
  tnb <-
  coord2dist(coordmatrix=tetragonula.coord[taiselect,],
    cut=50,file.format="decimal2",neighbors=TRUE)
  ta <- alleleconvert(strmatrix=tetragonula[taiselect,])
  tai <- alleleinit(allelematrix=ta,neighborhood=tnb$nblist)
  stressvals(tai,mdsdim=1:3)$MDSstress



