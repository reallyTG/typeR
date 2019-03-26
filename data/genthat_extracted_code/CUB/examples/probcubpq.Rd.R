library(CUB)


### Name: probcubpq
### Title: Probability distribution of a CUB model with covariates for both
###   feeling and uncertainty
### Aliases: probcubpq
### Keywords: distribution

### ** Examples

data(relgoods)
m<-10
naord<-which(is.na(relgoods$Physician))
nacov<-which(is.na(relgoods$Gender))
na<-union(naord,nacov)
ordinal<-relgoods$Physician[-na]
W<-Y<-relgoods$Gender[-na]
gama<-c(-0.91,-0.7); bet<-c(-0.81,0.93)
probi<-probcubpq(m,ordinal,Y,W,bet,gama)



