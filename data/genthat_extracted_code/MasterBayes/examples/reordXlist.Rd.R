library(MasterBayes)


### Name: reordXlist
### Title: Reorders Design Matrices
### Aliases: reordXlist
### Keywords: manip

### ** Examples

## Not run: 
##D data(WarblerG)
##D A<-extractA(WarblerG)
##D 
##D ped<-matrix(NA, 5,3)
##D ped[,1]<-1:5
##D ped[,2]<-c(rep(NA, 4), 3)
##D ped[,3]<-c(rep(NA, 4), 4)
##D 
##D genotypes<-simgenotypes(A, ped=ped)
##D 
##D sex<-c("Female", "Male", "Female", "Male","Female")
##D offspring<-c(0,0,0,0,1)
##D 
##D data<-data.frame(id=ped[,1], sex, offspring)
##D 
##D var1<-expression(varPed(x="offspring", restrict=0))
##D PdP<-PdataPed(formula=list(var1), data=data)
##D 
##D X.list<-getXlist(PdP)
##D # creates design matrices for offspring (in this case indivdiual "5")
##D 
##D X.list<-mismatches(X.list, G=genotypes$Gobs)
##D X.list<-fillX.G(X.list, A=A, G=genotypes$Gobs)
##D 
##D X.list.reord<-reordXlist(X.list)
##D 
##D # The design matrices for the genetic likelihoods are reordered
##D # by the number of mismatches.  The true parental combination
##D # now appears first rather than last.
##D 
##D X.list$X$"5"$G
##D X.list.reord$X$"5"$G
## End(Not run)



