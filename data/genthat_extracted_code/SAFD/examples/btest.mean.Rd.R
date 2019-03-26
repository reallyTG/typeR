library(SAFD)


### Name: btest.mean
### Title: One-sample bootstrap test for the mean of a FRV
### Aliases: btest.mean
### Keywords: htest univar

### ** Examples

#Example 1: run for bigger sample sizes:
data(XX)
V<-translator(XX[[3]],50)
V2<-V
SS<-vector("list",length=50)
for (j in 1:50){
 SS[[j]]<-generator(V2,)
 }
b<-btest.mean(SS,V2,B=10)
b

#Example 2: takes some time to run:
#data(Trees)
#V<-Trees[[1]][[47]]
#b<-btest.mean(Trees[[1]],V,100)
#b



