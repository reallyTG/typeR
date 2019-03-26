library(MultiVarMI)


### Name: trMVN.dat
### Title: Transformation of Normal Scores
### Aliases: trMVN.dat

### ** Examples

sndat<-data.frame(matrix(rnorm(1e4), ncol=5, nrow=1e4/5))

#ordinal marginal probabilities
m1<-c(0.4, 0.6)
names(m1)<-c(0,1)
m2<-c(0.2, 0.3, 0.5)
names(m2)<-c(0,2,3)
mps<-list(X1=m1, X2=m2)

#count rates
rates<-c(2, 3)
names(rates)<-c('X3', 'X4')

#continuous
nctsum<-data.frame(X5=c(1, 1, -0.31375, 0.82632, 0.31375, 0.02271)) #Weibull(1,1)
rownames(nctsum)<-c('Mean', 'Variance', 'a', 'b', 'c', 'd')

trdat<-trMVN.dat(indat=list(sndat), ord.mps=mps, nct.sum=nctsum, count.rate=rates)



