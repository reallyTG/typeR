library(NPHazardRate)


### Name: HRSurv
### Title: Estimate of the constant in the optimal AMISE expression
### Aliases: HRSurv

### ** Examples

x<-seq(0, 5,length=100) #design points where the estimate will be calculated
SampleSize<-100 #amount of data to be generated
ti<- rweibull(SampleSize, .6, 1) # draw a random sample
ui<-rexp(SampleSize, .2)         # censoring sample
cat("\n AMOUNT OF CENSORING: ", length(which(ti>ui))/length(ti)*100, "\n")
x1<-pmin(ti,ui)                  # observed data
cen<-rep.int(1, SampleSize)      # initialize censoring indicators
cen[which(ti>ui)]<-0             # 0's correspond to censored indicators

HRSurv(x, x1, cen, bw.nrd(x1), Biweight)



