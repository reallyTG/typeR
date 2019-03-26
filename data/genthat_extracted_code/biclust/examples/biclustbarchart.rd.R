library(biclust)


### Name: biclustbarchart
### Title: Bicluster Barchart
### Aliases: biclustbarchart
### Keywords: hplot cluster

### ** Examples

  set.seed(1)
  x=matrix(rnorm(900),30,30)
  x[1:5,1:5]=rnorm(25,3,0.3)
  x[11:15,11:15]=rnorm(25,-3,0.3)
  x[21:25,21:25]=rnorm(25,6,0.3)
  colnames(x)<-paste("Var.",1:30)
  bics <- biclust(x,BCPlaid(), back.fit = 2, shuffle = 3, fit.model = ~m
+ a + b, iter.startup = 5, iter.layer = 30,  verbose = TRUE)  
  biclustbarchart(x,bics, col="#A3E0D8")
  ord<-bicorder(bics, cols=TRUE, rev=TRUE)
  biclustbarchart(x,bics,which=ord)
  




