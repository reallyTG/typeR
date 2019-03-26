library(GLDEX)


### Name: fun.bimodal.fit.pml
### Title: Finds the final fits using partition maximum likelihood
###   estimation for the bimodal dataset.
### Aliases: fun.bimodal.fit.pml
### Keywords: smooth

### ** Examples

## Extract faithful[,2] into faithful2
# faithful2<-faithful[,2]

## Uses clara clustering method
# clara.faithful2<-clara(faithful2,2)$clustering

## Save into two different objects
# qqqq1.faithful2.cc<-faithful2[clara.faithful2==1]
# qqqq2.faithful2.cc<-faithful2[clara.faithful2==2]

## Find the initial values
# result.faithful2.init<-fun.bimodal.init(data1=qqqq1.faithful2.cc,
# data2=qqqq2.faithful2.cc, rs.leap1=3,fmkl.leap1=3,rs.init1 = c(-1.5, 1.5), 
# fmkl.init1 = c(-0.25, 1.5), rs.leap2=3,fmkl.leap2=3,rs.init2 = c(-1.5, 1.5), 
# fmkl.init2 = c(-0.25, 1.5))

## Find the final fits
# result.faithful2.rsrs<-fun.bimodal.fit.pml(data1=qqqq1.faithful2.cc,
# data2=qqqq2.faithful2.cc, result.faithful2.init[[2]],
# result.faithful2.init[[3]], result.faithful2.init[[1]],param1="rs",
# param2="rs",selc1="rs",selc2="rs")

## Output
# result.faithful2.rsrs



