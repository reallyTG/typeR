library(Relatedness)


### Name: Relatedness-package
### Title: Maximum Likelihood Estimation of Relatedness using EM Algorithm
### Aliases: Relatedness-package Relatedness
### Keywords: Relatedness

### ** Examples

require('Relatedness')
data(Genotype)
data(Frequencies)
data(Cross)
RelCoef(IndividualGenom=matrix(0,ncol=0,nrow=0),ParentalLineGenom=Genotype,
Freq=Frequencies,Crossing=Cross,ParentPop=rep(1,20),Phased=TRUE,NbCores=2)



