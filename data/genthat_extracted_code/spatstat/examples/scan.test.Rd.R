library(spatstat)


### Name: scan.test
### Title: Spatial Scan Test
### Aliases: scan.test
### Keywords: htest spatial

### ** Examples

   nsim <- if(interactive()) 19 else 2
   rr <- if(interactive()) seq(0.5, 1, by=0.1) else c(0.5, 1)
   scan.test(redwood, 0.1 * rr, method="poisson", nsim=nsim)
   scan.test(chorley, rr, method="binomial", case="larynx", nsim=nsim)



