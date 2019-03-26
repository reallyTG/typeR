library(spatstat)


### Name: pool.quadrattest
### Title: Pool Several Quadrat Tests
### Aliases: pool.quadrattest
### Keywords: spatial htest

### ** Examples

  Y <- split(humberside)
  test1 <- quadrat.test(Y[[1]])
  test2 <- quadrat.test(Y[[2]])
  pool(test1, test2, Xname="Humberside")



