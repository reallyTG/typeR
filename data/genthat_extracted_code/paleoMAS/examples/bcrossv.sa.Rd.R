library(paleoMAS)


### Name: bcrossv.sa
### Title: Bootstrap cross-validation of synthetic assemblages fossil
###   estimates
### Aliases: bcrossv.sa
### Keywords: manip arith math multivariate robust

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
#cross-validation without detrending
bcrossv.sa(modernq[,1],perq2,a.d,delta=25,method="canberra",quant=0.05,
trials=c(5, 0.05),detrend=FALSE)
#cross-validation with detrending
bcrossv.sa(modernq[,1],perq2,a.d,delta=25,method="canberra",quant=0.05,
trials=c(5, 0.05),detrend=TRUE)




