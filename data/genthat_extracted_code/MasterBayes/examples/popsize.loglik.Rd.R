library(MasterBayes)


### Name: popsize.loglik
### Title: Log-Likelihood of Unsampled Population Size
### Aliases: popsize.loglik
### Keywords: models

### ** Examples

## Not run: 
##D data(WarblerG)
##D A<-extractA(WarblerG)
##D 
##D sex<-c(rep("Male", 50), rep("Female", 100))
##D offspring<-c(rep(0,100), rep(1, 50))
##D terr<-as.factor(rep(1:50, 3))
##D id<-1:150
##D 
##D res1<-expression(varPed(x="offspring", restrict=0)) 
##D res2<-expression(varPed(x="terr", gender="Female", relational="OFFSPRING", 
##D   restrict="=="))  
##D  
##D test.data<-data.frame(id, sex, offspring, terr)
##D 
##D PdP<-PdataPed(formula=list(res1, res2), data=test.data)
##D 
##D simped<-simpedigree(PdP)
##D G<-simgenotypes(A, E1=0, E2=0, ped=simped$ped, no_dup=1)
##D 
##D # remove 25 males at random, leaving 25
##D 
##D rm.males<-sample(1:50, 25, replace=FALSE) 
##D 
##D data.rm<-test.data[-rm.males,]
##D GdPrm<-GdataPed(G=lapply(G$Gobs, function(x){x[-rm.males]}), 
##D   id=G$id[-rm.males])
##D 
##D # delete genotype and phenotype records
##D 
##D PdPrm<-PdataPed(formula=list(res1, res2), data=data.rm, USsire=TRUE)
##D 
##D X.listrm<-getXlist(PdP=PdPrm, GdP=GdPrm, A=A, E2=0)
##D 
##D X<-lapply(X.listrm$X, function(x){list(N=c(25,0,1,0), 
##D   G=c(sum(x$G[1:25]), 0, x$G[26], 0))})
##D 
##D # each offspring has 1 mother and 25 sampled fathers so the 4 classes are:
##D # a) 1*25 categories with both parents sampled, 0*25 categries with only 
##D # sires sampled b) 1*1 categories with only dams sired and 0*0 categories
##D # with both sexes unsampled. 
##D 
##D nUS<-seq(10,40, length=100)
##D nUS_Loglik<-1:100
##D for(i in 1:100){
##D  nUS_Loglik[i]<-popsize.loglik(X, USsire=TRUE, nUS=nUS[i])
##D }
##D plot(nUS_Loglik~nUS, type="l", main="Profile Log-likelihood
##D    for number of unsampled males")
## End(Not run)



