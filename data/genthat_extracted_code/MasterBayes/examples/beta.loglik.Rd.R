library(MasterBayes)


### Name: beta.loglik
### Title: Log-Likelihood of Beta
### Aliases: beta.loglik
### Keywords: models

### ** Examples

## Not run: 
##D data(WarblerP)
##D data(WarblerG)
##D 
##D GdP<-GdataPed(WarblerG)
##D 
##D res1<-expression(varPed("offspring", relational=FALSE, restrict=0))
##D var1<-expression(varPed(c("lat", "long"), gender="Male", 
##D   relational="OFFSPRING"))
##D res2<-expression(varPed("terr", gender="Female", relational="OFFSPRING", 
##D   restrict="=="))
##D 
##D PdP<-PdataPed(formula=list(var1,res1,res2), data=WarblerP)
##D 
##D # probability of paternity is modelled as a function of  distance 
##D 
##D X.list<-getXlist(PdP=PdP, GdP=GdP)
##D 
##D ped<-MLE.ped(X.list)$P
##D 
##D # get ML pedigree from genetic data alone
##D 
##D X<-lapply(X.list$X, function(x){list(S=x$XSs)})
##D 
##D # Extract Design matrices for Sires 
##D 
##D sire_pos<-match(ped[,3][as.numeric(names(X))], X.list$id)
##D sire_pos<-mapply(function(x,y){match(x, y$sire.id)}, sire_pos, X.list$X)
##D 
##D # row number of each design matrix corresponding to the ML sire. 
##D 
##D beta<-seq(-0.065,-0.0325, length=100)
##D beta_Loglik<-1:100
##D   for(i in 1:100){
##D      beta_Loglik[i]<-beta.loglik(X, sire_pos=sire_pos, beta=beta[i], 
##D      beta_map=X.list$beta_map) 
##D   }
##D 
##D plot(beta_Loglik~beta, type="l", main="Profile Log-likelihood for beta")
## End(Not run)



