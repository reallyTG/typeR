library(NPHazardRate)


### Name: DiscretizeData
### Title: Discretize the available data set
### Aliases: DiscretizeData

### ** Examples

x<-seq(0, 5,length=100) #design points where the estimate will be calculated
SampleSize<-100 #amount of data to be generated
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





