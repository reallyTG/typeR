library(spatstat)


### Name: pool.fv
### Title: Pool Several Functions
### Aliases: pool.fv
### Keywords: spatial htest hplot iteration

### ** Examples

   K <- lapply(waterstriders, Kest, correction="iso")
   Kall <- pool(K[[1]], K[[2]], K[[3]])
   Kall <- pool(as.anylist(K))
   plot(Kall, cbind(pooliso, pooltheo) ~ r,
              shade=c("loiso", "hiiso"),
              main="Pooled K function of waterstriders")



