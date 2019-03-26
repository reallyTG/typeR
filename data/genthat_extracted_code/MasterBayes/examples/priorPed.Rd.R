library(MasterBayes)


### Name: priorPed
### Title: priorPed Object
### Aliases: priorPed is.priorPed
### Keywords: classes

### ** Examples

## Not run: 
##D # When each individual has only been genotyped once, and no pedigree 
##D # information exists, there is virtually no information available
##D # to estimate error rates.  The tiny amount of information comes 
##D # (dangerously) from the assumption of Hardy-Weinburg equilibrium.  
##D # The posterior distribution is similar to the prior:
##D 
##D data(WarblerG)
##D A<-extractA(WarblerG)
##D 
##D ped<-matrix(NA, 100,3)
##D ped[,1]<-1:100
##D 
##D G<-simgenotypes(A, E1=0.01, E2=0.01, ped=ped, no_dup=1)
##D GdP<-GdataPed(G=G$Gobs, id=G$id)
##D pP<-priorPed(E1=matrix(c(40,1600), nrow=1), E2=matrix(c(40,1600), nrow=1))
##D 
##D model1<-MCMCped(GdP=GdP, pP=pP)
##D 
##D #The posterior distribution recovers the prior distribution 
##D 
##D summary(model1$E1)
##D quantile(rbeta(1000, 40, 1600), prob=c(0.025, 0.25, 0.5, 0.75, 0.975))
## End(Not run)



