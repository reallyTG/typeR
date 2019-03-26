library(DCL)


### Name: validating.incurred
### Title: Back-test: testing against the experience
### Aliases: validating.incurred
### Keywords: models

### ** Examples

data(NtriangleBDCL)
data(XtriangleBDCL)
data(ItriangleBDCL)

Ntriangle<-NtriangleBDCL
Xtriangle<-XtriangleBDCL
Itriangle<-ItriangleBDCL
## First compare the three methods to be validated (three different inflations)
validating.incurred(ncut=0,Xtriangle,Ntriangle,Itriangle)

## Now perform a backtest cutting up to four calendars backward
test.res<-matrix(NA,4,10)
par(mfrow=c(2,2),cex.axis=0.9,cex.main=1)
par(mar=c(1.5,1.5,1.5,1.5),oma=c(1,0.5,0.5,0.2),mgp=c(3,0.5,0)) 
for (i in 1:4)
{
  res<-validating.incurred(ncut=i,Xtriangle,Ntriangle,Itriangle,Tables=FALSE)
  test.res[i,]<-as.numeric(res$pe.vector)
}
test.res<-as.data.frame(test.res)
names(test.res)<-c("num.cut","pe.point.DCL","pe.point.BDCL","pe.point.IDCL",
"pe.calendar.DCL","pe.calendar.BDCL","pe.calendar.IDCL",
"pe.total.DCL","pe.total.BDCL","pe.total.IDCL")
print(test.res)



