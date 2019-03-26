library(MasterBayes)


### Name: mismatches
### Title: Parent-Offspring Genotype Mismatches
### Aliases: mismatches
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
##D PdP<-PdataPed(formula=list(res1), data=data)
##D 
##D X.list<-getXlist(PdP)
##D # creates design matrices for offspring (in this case indivdiual "5")
##D 
##D X.list.MM<-mismatches(X.list, G=genotypes$Gobs, mm.tol=0)
##D # genetic likelihoods are arranged sires within dams 
##D 
##D X.list.MM$X$"5"$mmD
##D # number of mismatches between offspring "5" and dams "1" and "3"
##D 
##D X.list.MM$X$"5"$mmS
##D # number of mismatches between offspring "5" and sires "4" and "5"
##D 
##D X.list.MM$X$"5"$restdam.id
##D X.list.MM$X$"5"$dam.id
##D # dams with mismatches are excluded  mismatch (mm.tol=0)
##D 
##D X.list.MM$X$"5"$restsire.id
##D X.list.MM$X$"5"$sire.id
##D # sires with mismatches are excluded  mismatch (mm.tol=0)
## End(Not run)



