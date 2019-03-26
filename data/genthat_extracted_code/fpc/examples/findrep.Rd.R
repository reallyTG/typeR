library(fpc)


### Name: findrep
### Title: Finding representatives for cluster border
### Aliases: findrep
### Keywords: cluster

### ** Examples

  options(digits=3)
  iriss <- as.matrix(iris[c(1:5,51:55,101:105),-5])
  irisc <- as.numeric(iris[c(1:5,51:55,101:105),5])
  findrep(iriss,colMeans(iriss),irisc,cluster=1,r=2)



