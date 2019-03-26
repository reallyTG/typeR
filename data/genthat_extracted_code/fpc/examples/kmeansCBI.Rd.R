library(fpc)


### Name: kmeansCBI
### Title: Interface functions for clustering methods
### Aliases: kmeansCBI hclustCBI hclusttreeCBI disthclustCBI
###   disthclusttreeCBI noisemclustCBI distnoisemclustCBI claraCBI pamkCBI
###   trimkmeansCBI disttrimkmeansCBI dbscanCBI mahalCBI mergenormCBI
###   speccCBI tclustCBI pdfclustCBI
### Keywords: cluster multivariate

### ** Examples

  options(digits=3)
  set.seed(20000)
  face <- rFace(50,dMoNo=2,dNoEy=0,p=2)
  dbs <- dbscanCBI(face,eps=1.5,MinPts=4)
  dhc <- disthclustCBI(dist(face),method="average",k=1.5,noisecut=2)
  table(dbs$partition,dhc$partition)
  dm <- mergenormCBI(face,G=10,modelNames="EEE",nnk=2)
  dtc <- tclustCBI(face,6,trim=0.1,restr.fact=500)
  table(dm$partition,dtc$partition)




