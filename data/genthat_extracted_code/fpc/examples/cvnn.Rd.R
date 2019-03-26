library(fpc)


### Name: cvnn
### Title: Cluster validation based on nearest neighbours
### Aliases: cvnn
### Keywords: cluster

### ** Examples

  options(digits=3)
  iriss <- as.matrix(iris[c(1:10,51:55,101:105),-5])
  irisc <- as.numeric(iris[c(1:10,51:55,101:105),5])
  print(cvnn(dist(iriss),list(irisc,rep(1:4,5))))



