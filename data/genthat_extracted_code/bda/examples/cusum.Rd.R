library(bda)


### Name: cusum
### Title: Cumulative Sum Control Chart.
### Aliases: cusum cusum.default ccusum bcusum plot.CCUSUM plot.BCUSUM
###   print.CCUSUM print.BCUSUM CCUSUM BCUSUM Restart Restart.default
###   Restart.CCUSUM
### Keywords: htest

### ** Examples

  data(robot)
  hst = robot$TMHSTMIN
  out = cusum(hst,mu=45)
  plot(out)



