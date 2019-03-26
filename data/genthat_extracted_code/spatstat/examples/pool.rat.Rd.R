library(spatstat)


### Name: pool.rat
### Title: Pool Data from Several Ratio Objects
### Aliases: pool.rat
### Keywords: spatial nonparametric

### ** Examples

   K1 <- Kest(runifpoint(42), ratio=TRUE, correction="iso")   
   K2 <- Kest(runifpoint(42), ratio=TRUE, correction="iso")   
   K3 <- Kest(runifpoint(42), ratio=TRUE, correction="iso")
   K <- pool(K1, K2, K3)
   plot(K, pooliso ~ r, shade=c("hiiso", "loiso"))



