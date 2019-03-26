library(MasterBayes)


### Name: fillX.G
### Title: Mendelian Transition Probabilities
### Aliases: fillX.G
### Keywords: manip

### ** Examples

## Not run: 
##D data(WarblerG)
##D A<-extractA(WarblerG)
##D 
##D ped<-matrix(NA, 5,3)
##D ped[,1]<-1:5
##D ped[,2]<-c(rep(NA, 4), 1)
##D ped[,3]<-c(rep(NA, 4), 2)
##D 
##D genotypes<-simgenotypes(A, ped=ped)
##D 
##D sex<-c("Female", "Male", "Female", "Male","Female")
##D offspring<-c(0,0,0,0,1)
##D 
##D data<-data.frame(id=ped[,1], sex, offspring)
##D 
##D res1<-expression(varPed(x="offspring", restrict=0))
##D 
##D PdP<-PdataPed(formula=list(res1), data=data)
##D GdP<-GdataPed(G=genotypes$Gobs, id=genotypes$id)
##D 
##D X.list<-getXlist(PdP)
##D # creates design matrices for offspring (in this case indivdiual "5")
##D 
##D X.list.G<-fillX.G(X.list, A=A, G=genotypes$Gobs, E2=0.005)
##D # genetic likelihoods are arranged sires within dams 
##D 
##D X.list.G$X$"5"$dam.id
##D X.list.G$X$"5"$sire.id
##D 
##D # so for this example we have parental combinations 
##D # ("1","2"), ("1","4"), ("3","2"), ("2","4"):
##D 
##D X.list.G$X$"5"$G
##D 
##D # The true parents have the highest likelihood in this case
## End(Not run)



