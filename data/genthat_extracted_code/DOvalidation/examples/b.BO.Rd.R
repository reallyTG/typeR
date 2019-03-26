library(DOvalidation)


### Name: b.BO
### Title: Best One-Sided Cross-Validation for Local Linear Hazards
### Aliases: b.BO
### Keywords: nonparametric survival

### ** Examples

data(Iceland)
Oi<-Iceland$D
Ei<-Iceland$E
ti<-40:110  # time is age and it goes from 40 to 110 years
my.bs<-seq(20,40,length.out=30)
res.bo<-b.BO(grid.b=my.bs,K="sextic",type.bo="Oi",xi=ti,Oi=Oi,Ei=Ei,wei="same")
bbo<-res.bo$bbo
cvs<-res.bo$cvbo.values
plot(my.bs,cvs,main="BO-validation score",xlab="Bandwidth")
print(paste("The best one-sided cross-validated bandwidth is:", bbo,sep=" "))



