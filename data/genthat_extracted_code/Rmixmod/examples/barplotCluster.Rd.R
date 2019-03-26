library(Rmixmod)


### Name: barplotCluster
### Title: Barplot of a class ['MixmodResults']
### Aliases: barplotCluster

### ** Examples

  data(birds)
  xem <- mixmodCluster(birds,2)
  barplotCluster(xem["bestResult"], birds)
  barplotCluster(xem["bestResult"], birds, variables=c(2,3,4))
  barplotCluster(xem["bestResult"], birds, variables=c("eyebrow","collar"))




