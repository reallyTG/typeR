library(DCL)


### Name: ItriangleBDCL
### Title: Incurred data (BDCL example)
### Aliases: ItriangleBDCL
### Keywords: datasets

### ** Examples

data(ItriangleBDCL)
data(XtriangleBDCL)
m<-nrow(XtriangleBDCL)

clm.I<-clm(ItriangleBDCL)
alpha.I<-clm.I$alpha
# The total paid for each accident year in the past
Ri.X<-rowSums(XtriangleBDCL,na.rm=TRUE)
# Incurred outstanding numbers
Ri.CL.incurred<-alpha.I-Ri.X
Total.CL.incurred<- sum(Ri.CL.incurred,na.rm=TRUE)

## Compare with CL on paid data
clm.X<-clm(XtriangleBDCL)
Xhat<-as.matrix(clm.X$triangle.hat)
Ri.CL.paid<-rowSums(Xhat)-rowSums(XtriangleBDCL,na.rm=TRUE)
Total.CL.paid<- sum(Ri.CL.paid,na.rm=TRUE)

# the predictions by rows
data.frame(underw.year=c(1:m,"Total"),CLM.paid=c(Ri.CL.paid,Total.CL.paid),
           CLM.incurred=round(c(Ri.CL.incurred,Total.CL.incurred),4))

# now the predictions by diagonals
inflat.factor<-Ri.CL.incurred/Ri.CL.paid
inflat.factor[Ri.CL.paid==0]<-1
# the lower triangle from incurred chain ladder is defined as:
Ihat<-Xhat
for (i in 1:m) Ihat[i,]<-Xhat[i,]*inflat.factor[i]
# now the sums by diagonals
Diag.CL.paid<-sapply(split(Xhat, row(Xhat)+col(Xhat)), sum, na.rm=TRUE)
Dclm.paid<-c(Diag.CL.paid[-(1:m)])
Total.CL.paid<- sum(Dclm.paid,na.rm=TRUE)
Dclm.paid<-c(Dclm.paid,Total.CL.paid)

Diag.CL.inc<-sapply(split(Ihat, row(Ihat)+col(Ihat)), sum, na.rm=TRUE)
Dclm.inc<-c(Diag.CL.inc[-(1:m)])
Total.CL.inc<- sum(Dclm.inc,na.rm=TRUE)
Dclm.inc<-c(Dclm.inc,Total.CL.inc)

# A table with the chain ladder predictions (paid and incurred data)
data.frame(Future.years=c(1:(m-1),'Tot.'),
    clm.paid=round(Dclm.paid),clm.incurred=round(Dclm.inc))



