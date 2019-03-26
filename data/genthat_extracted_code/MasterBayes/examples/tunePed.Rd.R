library(MasterBayes)


### Name: tunePed
### Title: tunePed Object
### Aliases: tunePed is.tunePed
### Keywords: classes

### ** Examples

## Not run: 
##D data(WarblerG)
##D A<-extractA(WarblerG)
##D 
##D ped<-matrix(NA, 100,3)
##D ped[,1]<-1:100
##D 
##D G<-simgenotypes(A, ped=ped, E1=0.1, E2=0.001, no_dup=2)
##D GdP<-GdataPed(G=G$Gobs, id=G$id)
##D 
##D model1<-MCMCped(GdP=GdP, nitt=1500, thin=1, burnin=500)
##D 
##D # The proposal distribution is to conservative for E1
##D # and the update is accepted about 70% of the time
##D 
##D plot(model1$E1)
##D autocorr(model1$E1)
##D 
##D # Succesive samples from the posterior distribution are 
##D # strongly autocorrelated.  Should of course run the chain
##D # for longer with a larger thinning interval, but a greater
##D # tuning parameter helps (now 3e-4, rather than 3e-5):
##D 
##D model2<-MCMCped(GdP=GdP, tP=tunePed(E1=10), nitt=1500, 
##D   thin=1, burnin=500)
##D 
##D plot(model2$E1)
##D autocorr(model2$E1)
## End(Not run)



