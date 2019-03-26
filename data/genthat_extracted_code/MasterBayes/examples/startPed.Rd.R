library(MasterBayes)


### Name: startPed
### Title: startPed Object
### Aliases: startPed is.startPed
### Keywords: classes

### ** Examples

## Not run: 
##D # In this example we simulate a pedigree and then fix the
##D # pedigree and estimate the population level paarmeters
##D 
##D data(WarblerP)
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
##D simped<-simpedigree(PdP, beta=-0.25)
##D 
##D # simulate a pedigree where paternity drops with distance (beta=-0.25)
##D 
##D sP<-startPed(ped=simped$ped, estP=FALSE)
##D model1<-MCMCped(PdP=PdP, sP=sP, nitt=3000, thin=2, burnin=1000) 
##D plot(model1$beta)
##D 
##D # The true underlying value is -0.25
## End(Not run)



