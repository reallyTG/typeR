library(MFT)


### Name: summary.MFT
### Title: summary.MFT
### Aliases: summary.MFT

### ** Examples

# Rate change detection in Poisson process 
# with three change points (at t = 250, 600 and 680)
set.seed(0)
Phi1 <- runif(rpois(1,lambda=390),0,250)
Phi2 <- runif(rpois(1,lambda=380),250,600)
Phi3 <- runif(rpois(1,lambda=200),600,680)
Phi4 <- runif(rpois(1,lambda=400),680,1000)
Phi  <- sort(c(Phi1,Phi2,Phi3,Phi4)) 
mft  <- MFT.rate(Phi)
summary(mft)





