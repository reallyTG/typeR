library(modQR)


### Name: getCTechSTM1/2u
### Title: Getting the List of Options CTechST for 'compContourM1/2u'
### Aliases: getCTechSTM1u getCTechSTM2u getCTechSTM1/2u

### ** Examples

##- a typical use of getCTechSTM1u: 
##computing all directional 0.01-quantiles of 49 random points 
##(uniformly distributed in the unit cube centered at zero) 
##after changing the default settings 
Tau  <- 0.01
XMat <- matrix(1, 49, 1)
YMat <- matrix(runif(3*49, -0.5, 0.5), 49, 3)
CTechST <- getCTechSTM1u()
CTechST$ReportI <- 1
COutST <- compContourM1u(Tau, YMat, XMat, CTechST)



