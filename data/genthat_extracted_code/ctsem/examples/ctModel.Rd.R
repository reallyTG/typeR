library(ctsem)


### Name: ctModel
### Title: Define a ctsem model
### Aliases: ctModel

### ** Examples

 ### Frequentist example:
 ### impulse and level change time dependent predictor 
 ### example from Driver, Oud, Voelkle (2015)
 data('ctExample2')
 tdpredmodel <- ctModel(n.manifest = 2, n.latent = 3, n.TDpred = 1, 
 Tpoints = 8, manifestNames = c('LeisureTime', 'Happiness'), 
 TDpredNames = 'MoneyInt', 
 latentNames = c('LeisureTime', 'Happiness', 'MoneyIntLatent'),
 LAMBDA = matrix(c(1,0, 0,1, 0,0), ncol = 3), TRAITVAR = "auto")

 tdpredmodel$TRAITVAR[3, ] <- 0
 tdpredmodel$TRAITVAR[, 3] <- 0
 tdpredmodel$DIFFUSION[, 3] <- 0
 tdpredmodel$DIFFUSION[3, ] <- 0
 tdpredmodel$T0VAR[3, ] <- 0
 tdpredmodel$T0VAR[, 3] <- 0
 tdpredmodel$CINT[3] <- 0
 tdpredmodel$T0MEANS[3] <- 0
 tdpredmodel$TDPREDEFFECT[3, ] <- 1
 tdpredmodel$DRIFT[3, ] <- 0
 
 
###Bayesian example:
model<-ctModel(type='stanct',
n.latent=2, latentNames=c('eta1','eta2'),
n.manifest=2, manifestNames=c('Y1','Y2'),
n.TDpred=1, TDpredNames='TD1', 
n.TIpred=3, TIpredNames=c('TI1','TI2','TI3'),
LAMBDA=diag(2))





