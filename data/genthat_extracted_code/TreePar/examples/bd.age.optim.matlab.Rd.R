library(TreePar)


### Name: bd.age.optim.matlab
### Title: bd.age.optim.matlab: Estimating speciation rate and
###   age-dependent extinction rate in phylogenies.
### Aliases: bd.age.optim.matlab

### ** Examples

## You need MCR to run the example
## directory where MCR is installed
# path<-"/Applications/MATLAB_R2014a_node.app/"
## location of folder TreePar_Matlab
#locationMat<-"/Users/tstadler/Documents/Data/Uni/Research/R/TreeParProject/TreePar_Matlab"
##
# setwd(locationMat)
# x<-read.table("branchingtimes.txt")
# numgridpts<-500
# lambda<-2
# k<-1
# theta<-1
# sampling<-1
# setwd(paste(locationMat,"/compiled",sep=""))
# LikAge(x,lambda, k, theta, sampling, path=path)
# outG <- bd.age.optim.matlab(x, lambda, k, theta, sampling, path=path)
# outE <- bd.age.optim.matlab(x, lambda, k, theta, sampling, path=path, model="E")
## compare with bd.shifts.optim for exponenetial lifetime
# outEcompare<-c(outE[1],1/(outE[2]*outE[3]),outE[2]-1/outE[3])
# outShifts <- bd.shifts.optim(x,sampling=c(1),survival=1)[[2]]



