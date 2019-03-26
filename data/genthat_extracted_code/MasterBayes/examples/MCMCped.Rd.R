library(MasterBayes)


### Name: MCMCped
### Title: Markov chain Monte Carlo Methods for Pedigree Reconstruction and
###   Analysis
### Aliases: MCMCped
### Keywords: models

### ** Examples


data(WarblerP)
data(WarblerG)

GdP<-GdataPed(WarblerG)

var1<-expression(varPed(c("lat", "long"), gender="Male", 
  relational="OFFSPRING"))

# paternity is to be modelled as a function of distance 
# between offspring and male territories

res1<-expression(varPed("offspring", restrict=0))

# indivdiuals from the offspring generation are excluded as parents

res2<-expression(varPed("terr", gender="Female", relational="OFFSPRING",
  restrict="=="))

# mothers not from the offspring territory are excluded
 
PdP<-PdataPed(formula=list(var1,res1,res2), data=WarblerP, USsire=FALSE)
tP<-tunePed(beta=30)

model1<-MCMCped(PdP=PdP, GdP=GdP, tP=tP, nitt=300, thin=1, burnin=0) 

plot(model1$beta)




