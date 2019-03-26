library(SoilR)


### Name: fW.Daycent1
### Title: Effects of moisture on decomposition rates according to the
###   DAYCENT model
### Aliases: fW.Daycent1

### ** Examples

swc=seq(0,0.8,by=0.01)  # A sequence of values of soil water content
fine=fW.Daycent1(swc)
coarse=fW.Daycent1(swc,a=0.55,b=1.7,c=-0.007,d=3.22)

#This plot reproduces Figure 2b in Kelly et al. (2000)
plot(fine,type="l",xlim=c(0,1))
lines(coarse,lwd=2)
legend("topleft",c("coarse","fine"),lty=c(1,1),lwd=c(2,1),bty="n")



