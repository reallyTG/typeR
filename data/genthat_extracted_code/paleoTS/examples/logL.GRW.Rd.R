library(paleoTS)


### Name: logL.GRW
### Title: Compute log-likelihoods for random walk and stasis models
### Aliases: logL.GRW logL.URW logL.Stasis logL.StrictStasis
### Keywords: models ts

### ** Examples

y<- sim.GRW(20, 0, 1)
L1 <- logL.GRW(p=c(0,1), y)   # actual parameters
L2 <- logL.GRW(p=c(10,10), y) # should be a bad guess
cat (L1, L2, "\n")



