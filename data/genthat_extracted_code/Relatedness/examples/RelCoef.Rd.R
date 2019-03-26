library(Relatedness)


### Name: RelCoef
### Title: Relatedness Coefficients Estimation for individuals
### Aliases: RelCoef
### Keywords: Relatedness

### ** Examples

require('Relatedness')
data(Genotype)
data(Frequencies)
data(Cross)
RelatednessCoefficient <- RelCoef(IndividualGenom=matrix(0,ncol=0,nrow=0),
				  ParentalLineGenom=Genotype,
				  Freq=Frequencies,Crossing=Cross,
				  ParentPop=rep(1,8),Phased=TRUE,NbCores=2)
print(RelatednessCoefficient$Delta3)



