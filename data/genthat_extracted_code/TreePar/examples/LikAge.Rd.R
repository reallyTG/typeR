library(TreePar)


### Name: LikAge
### Title: LikAge: Calculates the likelihood of speciation and extinction
###   rates for an ultrametric phylogeny under an age-dependent extinction
###   model conditioning on the age of the tree.
### Aliases: LikAge

### ** Examples

## You need MCR to run the example
## directory where MCR is installed
# path<-"/Applications/MATLAB_R2014a_node.app/"
## location of folder TreePar_Matlab
# locationMat<-"/Users/tstadler/Documents/Data/Uni/Research/R/TreeParProject/TreePar_Matlab"
#
# x<-1:20
# numgridpts<-500
# lambda<-2
# k<-1
# theta<-1
# sampling<-1
## Provide path where the folder TreePar_Matlab is available
# setwd(paste(locationMat,"/compiled",sep=""))
# LikAge(x,lambda, k, theta, sampling, path=path)
## If the shape parameter is 1, we have a constant extinction rate, 
## corresponding to the function LikShift. Then the following commands return the same result.
# LikAge(x,1, 1, 2, sampling, numgridpts=1000, path=path)
# LikShifts(x,c(0),c(1),c(1/2),c(1))



