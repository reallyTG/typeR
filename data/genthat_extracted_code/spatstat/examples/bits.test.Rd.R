library(spatstat)


### Name: bits.test
### Title: Balanced Independent Two-Stage Monte Carlo Test
### Aliases: bits.test
### Keywords: spatial htest

### ** Examples

 ns <- if(interactive()) 19 else 4
 bits.test(cells, nsim=ns)
 bits.test(cells, alternative="less", nsim=ns)
 bits.test(cells, nsim=ns, interpolate=TRUE)



