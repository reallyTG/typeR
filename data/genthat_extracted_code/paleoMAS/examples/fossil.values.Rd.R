library(paleoMAS)


### Name: fossil.values
### Title: Fossil environmental parameters calculation
### Aliases: fossil.values
### Keywords: manip arith math multivariate

### ** Examples

data(modernq,fossilq)
# Calculate percentages
perq<-percenta(modernq,first=2,last=39)[,2:55]
# filter data set to include only samples with at least 0.5
# percent in 20 percent of the samples
perq1<-filter.p(perq,presen=0.5,persist=0.2)$filtered
# calculate alpha and degree for each taxon through AIC
a.d<-akaike.all(modernq[,1],perq1)
# select taxa that have acceptable dispersion and normally 
# distributed residuals in percentages and AIC matrices
perq2<-perq1[,-c(3:5,8,17,19)]
a.d1<-a.d[-c(3:5,8,17,19),]
#build synthetic assemblages
syas.q<-synthetic(modernq[,1],perq2,a.d1,delta=25,plot=TRUE,
percen=rep(100,53))
#calculate distance from synthetic assemblages to each fossil sample
distances<-fossil.dist(syas.q,fossilq)
#calculate the fossil values of the environmental variable
# without detrending
fossil.values(distances,fossilq[,1],quant=0.05,detrend=FALSE)
#if detrending is desired, the detrending parameters have to be obtained
crossv.q<-bcrossv.sa(modernq[,1],perq2,a.d1,delta=25,method="canberra",
quant=0.05,trials=c(5, 0.05),detrend=TRUE)
#calculate the fossil values of the environmental variable
# with detrending
fossil.values(distances,fossilq[,1],quant=0.05,detrend=TRUE,
crossv=crossv.q)




