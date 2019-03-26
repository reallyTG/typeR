library(fpc)


### Name: cdbw
### Title: CDbw-index for cluster validation
### Aliases: cdbw
### Keywords: cluster

### ** Examples

  options(digits=3)
  iriss <- as.matrix(iris[c(1:5,51:55,101:105),-5])
  irisc <- as.numeric(iris[c(1:5,51:55,101:105),5])
  cdbw(iriss,irisc)



