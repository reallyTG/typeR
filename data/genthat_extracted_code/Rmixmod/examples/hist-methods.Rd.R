library(Rmixmod)


### Name: hist
### Title: Histograms of a class ['Mixmod']
### Aliases: hist hist,Mixmod-method

### ** Examples

  data(iris)
  xem <- mixmodCluster(iris[1:4],3)
  hist(xem)
  hist(xem,variables=c(1,3))
  hist(xem,variables=c("Sepal.Length","Sepal.Width"))




