library(Rmixmod)


### Name: plotCluster
### Title: Plotting of a class ['MixmodResults']
### Aliases: plotCluster

### ** Examples

  data(geyser)
  xem1 <- mixmodCluster(geyser,3)
  plotCluster(xem1["bestResult"], geyser)

  data(iris)
  xem2 <- mixmodCluster(iris[1:4],2:6)
  plotCluster(xem2["bestResult"], iris, variable1="Sepal.Length", variable2="Sepal.Width")
  plotCluster(xem2["bestResult"], iris, variable1=1, variable2=4)




