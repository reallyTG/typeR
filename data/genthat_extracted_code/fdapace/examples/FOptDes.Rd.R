library(fdapace)


### Name: FOptDes
### Title: Optimal Designs for Functional and Longitudinal Data for
###   Trajectory Recovery or Scalar Response Prediction
### Aliases: FOptDes

### ** Examples

set.seed(1)
n <- 50
pts <- seq(0, 1, by=0.05)
sampWiener <- Wiener(n, pts)
sampWiener <- MakeFPCAInputs(IDs = rep(1:n, each=length(pts)), 
                             tVec = rep(pts, times = n), 
                             yVec = t(sampWiener))
res <- FOptDes(Ly=sampWiener$Ly, Lt=sampWiener$Lt, p=2,
               isSequential=FALSE, RidgeCand = seq(0.02,0.2,0.02))



