library(saws)


### Name: clogistCalc
### Title: Conditional Logistic Regression fit
### Aliases: clogistCalc clogistInfo clogistLoglike
### Keywords: nonlinear

### ** Examples


data(micefat)
cout<-clogistCalc(micefat$N,micefat$NTUM,micefat[,c("fatCal","totalCal")],micefat$cluster)
## usual model based variance
saws(cout,method="dm")
## sandwich based variance with small sample correction
s3<-saws(cout,method="d3")
s3
print.default(s3)



