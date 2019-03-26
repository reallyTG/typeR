library(NPHazardRate)


### Name: DefVarBandRule
### Title: Default adaptive bandwidth rule
### Aliases: DefVarBandRule

### ** Examples

library(survival)
x<-seq(0, 5,length=100) #design points where the estimate will be calculated

SampleSize <- 100

ti<- rweibull(SampleSize, .6, 1)#draw a random sample from the actual distribution
ui<-rexp(SampleSize, .05)       #draw a random sample from the censoring distribution
cat("\n AMOUNT OF CENSORING: ", length(which(ti>ui))/length(ti)*100, "\n")
x1<-pmin(ti,ui)                 #this is the observed sample
cen<-rep.int(1, SampleSize)     #censoring indicators
cen[which(ti>ui)]<-0            #censored values correspond to zero

h2<-DefVarBandRule(ti, cen)     #Deafult Band. Rule - Weibull Reference



