library(paleoMAS)


### Name: syas
### Title: Synthetic assemblages
### Aliases: syas
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
# distributed residuals in percentages matrix
perq2<-perq1[,-c(3:5,8,17,19)]
#cross-validation of the method
bcrossv.sa(modernq[,1],perq2,a.d,delta=25,method="canberra",quant=0.05,trials=c(5, 0.05),detrend=FALSE)
#synthetic assemblages fossil estimation without detrending
syas(modernq[,1],perq2,a.d,fossilq,fossilq[,1],delta=25,percen=rep(100,53),
plot=TRUE,window=3,detrend=FALSE,xlabel="Elevation (m asl)")
#synthetic assemblages fossil estimation with detrending
#first, estimation of the detrending parameters
crossv.q<-bcrossv.sa(modernq[,1],perq2,a.d,delta=25,method="canberra",
quant=0.05,trials=c(5, 0.05),detrend=TRUE)
#second, application of the synthetic assemblages using the
# results of the cross-validation for the detrending.
syas(modernq[,1],perq2,a.d,fossilq,fossilq[,1],delta=25,percen=rep(100,53),
plot=TRUE,detrend=TRUE,crossv=crossv.q,xlabel="Elevation (m asl)")



