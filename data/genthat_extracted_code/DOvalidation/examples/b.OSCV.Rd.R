library(DOvalidation)


### Name: b.OSCV
### Title: DO-Validation for Local Linear Hazards
### Aliases: b.OSCV
### Keywords: nonparametric

### ** Examples

data(UK)
Oi<-UK$D
Ei<-UK$E 
ti<-40:110  # time is age and it goes from 40 to 110 years
M<-length(ti)
my.bs<-seq(3,10,length=50)
## The left one-sided cross-validated bandwidth
res.left<-b.OSCV(grid.b=my.bs,K="sextic",Ktype="left",xi=ti,Oi=Oi,Ei=Ei) 
bleft<-res.left$boscv
## The right one-sided cross-validated bandwidth
res.right<-b.OSCV(grid.b=my.bs,K="sextic",Ktype="right",xi=ti,Oi=Oi,Ei=Ei) 
bright<-res.right$boscv
## The DO-validated bandwidth
bdo<-(bleft+bright)/2
print(paste("DO-validated bandwidth= ", bdo, sep=""))



