library(NPHazardRate)


### Name: iHazardRateEst
### Title: Kernel Integrated Hazard Rate Estimation
### Aliases: iHazardRateEst

### ** Examples

x<-seq(0, 5,length=100) #design points where the estimate will be calculated

SampleSize <- 100
ti<- rweibull(SampleSize, .6, 1)  #draw a random sample from the actual distribution
ui<-rexp(SampleSize, .2)  #draw a random sample from the censoring distribution
cat("\n AMOUNT OF CENSORING: ", length(which(ti>ui))/length(ti)*100, "\n")
x1<-pmin(ti,ui)             #this is the observed sample
cen<-rep.int(1, SampleSize) #censoring indicators
cen[which(ti>ui)]<-0        #censored values correspond to zero
huse<-PlugInBand(x1, x,   cen, Biweight)
arg2<-iHazardRateEst(x1, x, IntEpanechnikov, huse, cen) #Calculate the estimate



