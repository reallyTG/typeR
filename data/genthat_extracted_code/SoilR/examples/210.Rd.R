library(SoilR)


### Name: plotCPool
### Title: Plots the output of 'getC' or 'getReleaseFlux' for each pool
###   over time
### Aliases: plotCPool

### ** Examples

years=seq(1901,2009,by=0.5)
LitterInput=700 

Ex=ThreepFeedbackModel14(
  t=years,ks=c(k1=1/2.8, k2=1/35, k3=1/100),C0=c(200,5000,500),
  F0=c(0,0,0), In=LitterInput, a21=0.1,a12=0.01,a32=0.005,a23=0.001,
  inputFc=C14Atm_NH
)
Ct=getC(Ex)
Rt=getReleaseFlux(Ex)

pal=rainbow(3)
plotCPool(t=years,mat=Ct,col=pal,xlab="Time (yrs)",
          ylab="Carbon stocks",ylim=c(min(Ct),max(Ct)))



