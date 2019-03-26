library(gStream)


### Name: gStream
### Title: Graph-Based Sequential Change-Point Detection
### Aliases: gStream

### ** Examples

  # This example contains two distance matrices constructed using L2 distance (distM1 and distM2).
  #In this example, the data is treated as if it were being observed sequentally
  # in order to illustrate how the package works.

  data(Example)

  # Example:
  # distM1 is a distance matrix constructed from a dataset with n=40 observation.
  # The first 20 observations are treated as historical observations.
  # It has been determined that there are no change-points among the
  # first 20 observations (see package gSeg for offline change-point detection).
  # There is change in mean when tau = 20 (This means a change happens 20 observations
  # after we start the tests. We start the test at N0+1 = 21.)
  # The following code shows the data generating scheme to create distM1:
  # (uncomment to run)
  # N0 = 20 # the first 20 observations are historical observations
  # N1 = N0 + 10
  # N2 = N1 + 10
  # d = 10
  # vmu = 10
  # set.seed(15)
  # y1 = matrix(0,N1,d)
  # y2 = matrix(0,N2-N1,d)
  # for (i in 1:N1) y1[i,] = rnorm(d)
  # for (i in 1:(N2-N1)) y2[i,] = rnorm(d, vmu)
  # y = rbind(y1,y2)
  # distM1 = as.matrix(dist(y))
  # diag(distM1) = max(distM1)+100

  N0 = 20
  L = 20 # the k-nn graph is constructed on only the L most recent observations.
  k = 1

  r1= gstream(distM1, L, N0, k, statistics="all", n0=0.3*L, n1=L-0.3*L,
  ARL=200,alpha=0.05, skew.corr=TRUE)

  # output results based on all four statistics; the scan statistics can be found in r1$scanZ
  r1$tauhat # reports the locations where a change-point is detected
  r1$b # reports the analytical approximations of the thresholds used in the stopping rules
  
  # Set ARL = 10,000
  # r1= gstream(distM1, L, N0, k, statistics="all", n0=0.3*L, n1=L-0.3*L,
  # ARL=10000,alpha=0.05, skew.corr=TRUE) # uncomment to run this function



