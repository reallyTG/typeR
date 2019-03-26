library(DOvalidation)


### Name: b.OSCV.MBC
### Title: DO-Validation for Multiplicative Bias Corrected Hazard
###   Estimators
### Aliases: b.OSCV.MBC
### Keywords: nonparametric survival

### ** Examples

data(Iceland)
Oi<-Iceland$D
Ei<-Iceland$E
ti<-40:110  # time is age and it goes from 40 to 110 years
my.bs<-seq(50,80,length.out=30)
## The left one-sided cross-validated bandwidth
res.left<-b.OSCV.MBC(grid.b=my.bs,K="sextic",Ktype="left",
    xi=ti,Oi=Oi,Ei=Ei,wei="same")
bleft<-res.left$boscv
## The right one-sided cross-validated bandwidth
res.right<-b.OSCV.MBC(grid.b=my.bs,K="sextic",Ktype="right",
    xi=ti,Oi=Oi,Ei=Ei,wei="same") 
bright<-res.right$boscv
## The do-validated bandwidth
bdo<-(bleft+bright)/2
print(paste("DO-validated bandwidth= ", bdo, sep=""))



