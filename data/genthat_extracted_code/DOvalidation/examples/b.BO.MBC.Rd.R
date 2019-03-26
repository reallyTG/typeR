library(DOvalidation)


### Name: b.BO.MBC
### Title: Best One-Sided Cross-Validation for Multiplicative Bias
###   Corrected Hazard Estimators
### Aliases: b.BO.MBC
### Keywords: nonparametric survival

### ** Examples

data(Iceland)
Oi<-Iceland$D
Ei<-Iceland$E
ti<-40:110  # time is age and it goes from 40 to 110 years
my.bs<-seq(50,80,length.out=30)
res.bo<-b.BO.MBC(grid.b=my.bs,K="sextic",type.bo = "Oi",xi=ti,Oi=Oi,Ei=Ei,wei="same")
bbo<-res.bo$bbo
cvs<-res.bo$cvbo.values
plot(my.bs,cvs,main="BO-validation score",xlab="Bandwidth")
print(paste("The best one-sided cross-validated bandwidth is:", bbo,sep=" "))



