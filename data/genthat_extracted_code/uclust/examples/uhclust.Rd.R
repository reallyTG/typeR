library(uclust)


### Name: uhclust
### Title: U-statistic based significance hierarchical clustering
### Aliases: uhclust

### ** Examples


x = matrix(rnorm(100000),nrow=50)  #creating homogeneous Gaussian dataset
res = uhclust(data=x)


x[1:30,] = x[1:30,]+0.7   #Heterogeneous dataset
x[1:10,] = x[1:10,]+0.4
res = uhclust(data=x)
res$groups




