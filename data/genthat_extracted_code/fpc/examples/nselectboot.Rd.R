library(fpc)


### Name: nselectboot
### Title: Selection of the number of clusters via bootstrap
### Aliases: nselectboot
### Keywords: cluster multivariate

### ** Examples
  
  set.seed(20000)
  face <- rFace(50,dMoNo=2,dNoEy=0,p=2)
  nselectboot(dist(face),B=2,clustermethod=disthclustCBI,
   method="average",krange=5:7)
  nselectboot(dist(face),B=2,clustermethod=claraCBI,
   classification="centroid",krange=5:7)
  nselectboot(face,B=2,clustermethod=kmeansCBI,
   classification="centroid",krange=5:7)
# Of course use larger B in a real application.



