library(DOvalidation)


### Name: b.CV.MBC
### Title: Least Squares Cross-Validation for Multiplicative Bias Corrected
###   Hazard Estimators
### Aliases: b.CV.MBC
### Keywords: nonparametric survival

### ** Examples

data(Iceland)
Oi<-Iceland$D
Ei<-Iceland$E
ti<-40:110  # time is age and it goes from 40 to 110 years
my.bs<-seq(50,80,length.out=30)
res.cv<-b.CV.MBC(grid.b=my.bs,K="sextic",xi=ti,Oi=Oi,Ei=Ei,wei="same")
bcv<-res.cv$bcv
cv.values<-res.cv$cv.values
plot(my.bs,cv.values,main="Cross-validation score",xlab="Bandwidth")
print(paste("The cross-validated bandwidth is:", bcv,sep=" "))





