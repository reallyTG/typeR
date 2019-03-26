library(MasterBayes)


### Name: modeP
### Title: Posterior Mode of Parents
### Aliases: modeP
### Keywords: distribution

### ** Examples

## Not run: 
##D data(WarblerP)
##D data(WarblerG)
##D GdP<-GdataPed(WarblerG)
##D 
##D var1<-expression(varPed(c("lat", "long"), gender="Male", 
##D   relational="OFFSPRING"))
##D 
##D # paternity is to be modelled as a function of distance 
##D # between offspring and male territories
##D 
##D res1<-expression(varPed("offspring", restrict=0))
##D 
##D # indivdiuals from the offspring generation are excluded as parents
##D 
##D res2<-expression(varPed("terr", gender="Female", relational="OFFSPRING", 
##D   restrict="=="))
##D 
##D # mothers not from the offspring territory are excluded
##D  
##D PdP<-PdataPed(formula=list(var1,res1,res2), data=WarblerP, USsire=FALSE)
##D tP<-tunePed(beta=30)
##D 
##D model1<-MCMCped(PdP=PdP, GdP=GdP, tP=tP, nitt=3000, thin=2, burnin=1000) 
##D 
##D ped<-modeP(model1$P, threshol=0.9)
##D ped
## End(Not run)



