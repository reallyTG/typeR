library(NPHazardRate)


### Name: LocLinEst
### Title: Local Linear Hazard Rate Estimator
### Aliases: LocLinEst

### ** Examples

x<-seq(0.05, 5,length=80) #grid points to calculate the estimates
plot(x, HazardRate(x,"weibull", .6, 1),type="l", xlab = "x",ylab="Hazard rate")

SampleSize = 100                 #select sample size
ti<- rweibull(SampleSize, .6, 1) # draw a random sample
ui<-rexp(SampleSize, .2)         # censoring sample
cat("\n AMOUNT OF CENSORING: ", length(which(ti>ui))/length(ti)*100, "\n")
x1<-pmin(ti,ui)                  # observed data
cen<-rep.int(1, SampleSize)      # initialize censoring indicators
cen[which(ti>ui)]<-0             # 0's correspond to censored indicators

a.use<-DiscretizeData(ti, x)     # discretize the data
BinCenters<-a.use$BinCenters     # get the data centers
ci<-a.use$ci                     # get empircal hazard rate estimates
Delta=a.use$Delta                # Binning range
h2<-bw.nrd(ti)                   # Bandwidth to use in constant est. of the plug in rule
h.use<-h2                        # the first element is the band to use

# Calcaculate the plug-in bandwidth:
huse1<- LLHRPlugInBand(BinCenters,h.use,Epanechnikov,Delta,ti,x,IntEpanechnikov,ci, cen)
arg2<-HazardRateEst(x1,x,Epanechnikov, huse1, cen)      # Tanner-Wong Estimate
lines(x, arg2, lty=2) # draw the Tanner-Wong   estimate # Draw TW estimate
arg5<-HazardRateEst(x1,x,BoundaryBiweight,huse1,cen)    # Boundary adjusted TW est
lines(x, arg5, lty=2, col=4) # draw the variable bandwidth # Draw the estimate
arg6<-LocLinEst(BinCenters ,x, huse1, Epanechnikov, ci) # Local linear est.
lines(x, arg6, lty=5, col=5)                             # Draw the estimate
legend("topright", c("Tanner-Wong",  "TW - Boundary Corrected", "Local Linear"),
          lty=c(2,2, 5), col=c(1,4, 5)) # add legend



