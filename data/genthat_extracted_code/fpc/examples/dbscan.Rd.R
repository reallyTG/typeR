library(fpc)


### Name: dbscan
### Title: DBSCAN density reachability and connectivity clustering
### Aliases: dbscan print.dbscan plot.dbscan predict.dbscan
### Keywords: multivariate cluster

### ** Examples

  set.seed(665544)
  n <- 600
  x <- cbind(runif(10, 0, 10)+rnorm(n, sd=0.2), runif(10, 0, 10)+rnorm(n,
    sd=0.2))
  par(bg="grey40")
  ds <- dbscan(x, 0.2)
# run with showplot=1 to see how dbscan works.
  ds
  plot(ds, x)

  x2 <- matrix(0,nrow=4,ncol=2)
  x2[1,] <- c(5,2)
  x2[2,] <- c(8,3)
  x2[3,] <- c(4,4)
  x2[4,] <- c(9,9)
  predict(ds, x, x2)

  n <- 600
  x <- cbind((1:3)+rnorm(n, sd=0.2), (1:3)+rnorm(n, sd=0.2))

# Not run, but results from my machine are 0.105 - 0.068 - 0.255:
#  system.time(ds <- dbscan(x, 0.3, countmode=NULL, method="raw"))[3] 
#  system.time(dsb <- dbscan(x, 0.3, countmode=NULL, method="hybrid"))[3]
#  system.time(dsc <- dbscan(dist(x), 0.3, countmode=NULL,
#    method="dist"))[3]



