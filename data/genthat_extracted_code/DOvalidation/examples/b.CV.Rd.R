library(DOvalidation)


### Name: b.CV
### Title: Least Squares Cross-Validation for Local Linear Hazards
### Aliases: b.CV
### Keywords: nonparametric survival

### ** Examples

data(UK)
Oi<-UK$D
Ei<-UK$E 
ti<-40:110  # time is age and it goes from 40 to 110 years
M<-length(ti)
my.bs<-seq(1,5,length=50)
res.cv<-b.CV(grid.b=my.bs,K="sextic",xi=ti,Oi=Oi,Ei=Ei)
bcv<-res.cv$bcv
cv.values<-res.cv$cv.values
plot(my.bs,cv.values,main="Cross-validation score",xlab="Bandwidth")
print(paste("The cross-validated bandwidth is:", bcv,sep=" "))



