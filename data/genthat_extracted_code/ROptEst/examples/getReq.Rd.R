library(ROptEst)


### Name: getReq
### Title: getReq - computation of the radius interval where IC1 is better
###   than IC2.
### Aliases: getReq
### Keywords: robust

### ** Examples

N0 <- NormLocationFamily(mean=2, sd=3)
## L_2 family + infinitesimal neighborhood
neighbor <- ContNeighborhood(radius = 0.5)
N0.Rob1 <- InfRobModel(center = N0, neighbor = neighbor)
## OBRE solution (ARE 95%)
N0.ICA <- optIC(model = N0.Rob1, risk = asAnscombe(.95))
## MSE solution
N0.ICM <- optIC(model=N0.Rob1, risk=asMSE())

getReq(asMSE(),neighbor,N0.ICA,N0.ICM,n=1)
getReq(asMSE(),neighbor,N0.ICA,N0.ICM,n=30)

## Don't test to reduce check time on CRAN
## No test: 
## RMX solution
N0.ICR <- radiusMinimaxIC(L2Fam=N0, neighbor=neighbor,risk=asMSE())

getReq(asL1(),neighbor,N0.ICA,N0.ICM,n=30)
getReq(asL4(),neighbor,N0.ICA,N0.ICM,n=30)
getReq(asMSE(),neighbor,N0.ICA,N0.ICR,n=30)
getReq(asL1(),neighbor,N0.ICA,N0.ICR,n=30)
getReq(asL4(),neighbor,N0.ICA,N0.ICR,n=30)
getReq(asMSE(),neighbor,N0.ICM,N0.ICR,n=30)


### when to use MAD and when Qn 
##  for Qn, see C. Croux, P. Rousseeuw (1993). Alternatives to the Median 
##      Absolute Deviation, JASA 88(424):1273-1283
L2M <- NormScaleFamily()
IC.mad <- makeIC(function(x)sign(abs(x)-qnorm(.75)),L2M)
d.qn <- (2^.5*qnorm(5/8))^-1
IC.qn <- makeIC(function(x) d.qn*(1/4 - pnorm(x+1/d.qn) + pnorm(x-1/d.qn)), L2M)
getReq(asMSE(), neighbor, IC.mad, IC.qn)
getReq(asMSE(), neighbor, IC.mad, IC.qn, radOrOutl = "Outlier", n = 30)
# => MAD is better once r > 0.5144 (i.e. for more than 2 outliers for n = 30)
## End(No test)



