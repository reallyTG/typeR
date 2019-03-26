library(AGHmatrix)


### Name: formatmatrix
### Title: Transform a matrix in 3 columns
### Aliases: formatmatrix

### ** Examples

#Example with random matrix
data<-matrix(c(1,0.1,0,0.1,1,0,0,0,1.1),3)
formatmatrix(data=data,return=TRUE,exclude.0=TRUE)

#Example with pedigree matrix
#Reading the example data
data(ped.mrode)
#Making Relationship Matrix
Amrode<-Amatrix(ped.mrode)
#Inverting the Matrix
Amrode.inv<-solve(Amrode)
#Making the 3 columns format
Amrode.inv.ASREML<-formatmatrix(Amrode,return=TRUE,exclude.0=TRUE)
#Printing it
Amrode.inv.ASREML 




