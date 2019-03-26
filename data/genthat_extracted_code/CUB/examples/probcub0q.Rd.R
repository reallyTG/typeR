library(CUB)


### Name: probcub0q
### Title: Probability distribution of a CUB model with covariates for the
###   feeling component
### Aliases: probcub0q
### Keywords: distribution

### ** Examples

data(relgoods)
m<-10
naord<-which(is.na(relgoods$Physician))
nacov<-which(is.na(relgoods$Gender))
na<-union(naord,nacov)
ordinal<-relgoods$Physician[-na]
W<-relgoods$Gender[-na]
pai<-0.44; gama<-c(-0.91,-0.7)
pr<-probcub0q(m,ordinal,W,pai,gama)



