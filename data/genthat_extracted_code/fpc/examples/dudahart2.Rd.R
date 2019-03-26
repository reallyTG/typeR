library(fpc)


### Name: dudahart2
### Title: Duda-Hart test for splitting
### Aliases: dudahart2
### Keywords: cluster

### ** Examples

  options(digits=2)
  set.seed(98765)
  iriss <- iris[sample(150,20),-5]
  km <- kmeans(iriss,2)
  dudahart2(iriss,km$cluster)



