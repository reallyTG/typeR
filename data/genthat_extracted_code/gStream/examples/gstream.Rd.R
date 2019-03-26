library(gStream)


### Name: gstream
### Title: Sequential Change-Point Detection based on k-Nearest Neighbors
### Aliases: gstream

### ** Examples

# This example contains two distance matrices (distM1 and distM2).
# Information on how distM1 and distM2 are generated can be found in gStream.

data(Example)

# Example:
 # distM1 is a distance matrix constructed from a dataset with n=40 observation.
  # The first 20 observations are treated as historical observations.
  # It has been determined that there are no change-points among the
  # first 20 observations (see package gSeg for offline change-point detection).
  # There is change in mean when tau = 20 (This means a change happens 20 observations
  # after we start the tests. We start the test at N0+1 = 21.)
  N0 = 20
  L = 20 # the k-nn graph is constructed on only the L most recent observations.
  k = 1

  r1= gstream(distM1, L, N0, k, statistics="all", n0=0.3*L, n1=L-0.3*L,
  ARL=200,alpha=0.05, skew.corr=FALSE)
  # output results based on all four statistics; the scan statistics can be found in r1$scanZ
  r1$tauhat # reports the locations where a change-point is detected
  r1$b # reports the analytical approximations of the thresholds used in the stopping rules
  
  # Set ARL = 10,000
  # r1= gstream(distM1, L, N0, k, statistics="all", n0=0.3*L, n1=L-0.3*L,
  # ARL=10000,alpha=0.05, skew.corr=TRUE) # uncomment to run this function



