library(SAFD)


### Name: XX
### Title: Example data
### Aliases: XX
### Keywords: datasets

### ** Examples

data(XX)
V<-translator(XX[[1]],50)
SS1<-vector("list",length=100)
for (j in 1:100){
 SS1[[j]]<-generator(V,)
 }
M<-Mmean(SS1,1)
head(M)
b<-bertoluzza(M,V,1/3,1) 
b 



