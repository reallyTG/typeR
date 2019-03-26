library(fpc)


### Name: calinhara
### Title: Calinski-Harabasz index
### Aliases: calinhara
### Keywords: cluster

### ** Examples

  set.seed(98765)
  iriss <- iris[sample(150,20),-5]
  km <- kmeans(iriss,3)
  round(calinhara(iriss,km$cluster),digits=2)



