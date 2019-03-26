library(CUB)


### Name: probcubp0
### Title: Probability distribution of a CUB model with covariates for the
###   uncertainty component
### Aliases: probcubp0
### Keywords: distribution

### ** Examples

data(relgoods)
m<-10
naord<-which(is.na(relgoods$Physician))
nacov<-which(is.na(relgoods$Gender))
na<-union(naord,nacov)
ordinal<-relgoods$Physician[-na]
Y<-relgoods$Gender[-na]
bet<-c(-0.81,0.93); csi<-0.20
probi<-probcubp0(m,ordinal,Y,bet,csi)



