library(spatstat)


### Name: dg.test
### Title: Dao-Genton Adjusted Goodness-Of-Fit Test
### Aliases: dg.test
### Keywords: spatial htest

### ** Examples

 ns <- if(interactive()) 19 else 4
 dg.test(cells, nsim=ns)
 dg.test(cells, alternative="less", nsim=ns)
 dg.test(cells, nsim=ns, interpolate=TRUE)



