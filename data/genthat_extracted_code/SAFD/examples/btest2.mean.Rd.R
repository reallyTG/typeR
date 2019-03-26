library(SAFD)


### Name: btest2.mean
### Title: Two-sample bootstrap test on the equality of mean of two FRVs
### Aliases: btest2.mean
### Keywords: htest univar

### ** Examples

#Example 1: run for bigger B
data(XX)
X<-translator(XX[[1]],20)
Y<-translator(XX[[2]],20)
XX<-vector("list",length=30)
for (j in 1:30){
 XX[[j]]<-generator(X,)
 }
YY<-vector("list",length=20)
for (j in 1:20){
 YY[[j]]<-generator(Y,)
 }
b<-btest2.mean(XX,YY,B=10)
b

#Example 2: takes some time in the current version:
#data(Trees)
#b<-btest2.mean(Trees[[1]],Trees[[2]],50)
#b
#b<-btest2.mean(Trees[[1]],Trees[[3]],50)
#b



