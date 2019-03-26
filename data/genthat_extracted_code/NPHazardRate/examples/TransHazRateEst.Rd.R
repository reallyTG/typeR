library(NPHazardRate)


### Name: TransHazRateEst
### Title: Transformation Based Hazard Rate Estimator
### Aliases: TransHazRateEst

### ** Examples

x<-seq(0, 5,length=100) #design points where the estimate will be calculated
plot(x, HazardRate(x, "weibull", .6, 1),  type="l",
                   xlab = "x", ylab="Hazard rate") #plot true hazard rate function
SampleSize <- 100
mat<-matrix(nrow=SampleSize, ncol=20)
for(i in 1:20)
{ #Calculate the average of 20 estimates and draw on the screen
 ti<- rweibull(SampleSize, .6, 1)  #draw a random sample from the actual distribution
 ui<-rexp(SampleSize, .05)          #draw a random sample from the censoring distribution
 cat("\n AMOUNT OF CENSORING: ", length(which(ti>ui))/length(ti)*100, "\n")
 x1<-pmin(ti,ui)                   #this is the observed sample
 cen<-rep.int(1, SampleSize)       #censoring indicators
 cen[which(ti>ui)]<-0              #censored values correspond to zero

 h2<-DefVarBandRule(ti, cen)     #Deafult Band. Rule - Weibull Reference
 huse1<- PlugInBand(x1, x,   cen, Biweight) #
 mat[,i]<-TransHazRateEst(x1,x,Epanechnikov,IntEpanechnikov,huse1,h2,cen)
}
lines(x, rowMeans(mat) , lty=2) #draw the average transformed estimate



