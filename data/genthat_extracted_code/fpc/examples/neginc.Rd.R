library(fpc)


### Name: neginc
### Title: Neg-entropy normality index for cluster validation
### Aliases: neginc
### Keywords: cluster

### ** Examples

  options(digits=3)
  iriss <- as.matrix(iris[c(1:10,51:55,101:105),-5])
  irisc <- as.numeric(iris[c(1:10,51:55,101:105),5])
  neginc(iriss,irisc)



