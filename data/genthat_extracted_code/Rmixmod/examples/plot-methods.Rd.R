library(Rmixmod)


### Name: plot
### Title: Plotting of a class ['Mixmod']
### Aliases: plot plot,Mixmod-method

### ** Examples

  ## for quantitative case
  data(iris)
  xem <- mixmodCluster(iris[1:4],3)
  plot(xem)
  plot(xem,c(1,3))
  plot(xem,c("Sepal.Length","Sepal.Width"))

  ## for qualitative case
  data(birds)
  xem2 <- mixmodCluster(birds,2)
  plot(xem2)
  legend("bottomleft",c("Cluster1","Cluster2"),col=c(2,3),pch=c(1,2))




