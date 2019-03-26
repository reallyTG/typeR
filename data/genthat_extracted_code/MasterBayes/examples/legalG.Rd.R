library(MasterBayes)


### Name: legalG
### Title: Legal Genotype Configurations
### Aliases: legalG
### Keywords: manip models

### ** Examples

## Not run: 
##D data(WarblerG)
##D A<-extractA(WarblerG[,16:17])
##D 
##D pedigree<-matrix(NA, 8,3)
##D pedigree[,1]<-1:8
##D pedigree[,2][5:8]<-c(1,1,2,2)
##D pedigree[,3][5:8]<-c(3,3,4,4)
##D 
##D G<-simgenotypes(A, E1=0, E2=0.3, ped=pedigree, no_dup=1)
##D 
##D newG<-legalG(G=G$Gobs,A=A,ped=pedigree)
##D newG$valid
##D 
##D # The input genotypes had a zero probability given the pedigree 
##D # (because of genotype error) but the output genotypes have 
##D # positive probability
##D 
##D legalG(newG$G,A,pedigree)$valid
## End(Not run)



