library(Rramas)


### Name: decline
### Title: Compute Declination and Explosion Probabilities
### Aliases: decline explosion summary.rmas.risk plot.summary.rmas.risk
### Keywords: models

### ** Examples

  
     data(coryphanthaA)
     coryphanthaA <- as.tmatrix(coryphanthaA)
     #initial abundances:
     v0 <- c(100,0,0)
       
     # run 1000 simulations of 20 years with  demographic stochasticity:
     simu20.ds <- projectn(v0=v0, mat=coryphanthaA, time = 20, estdem=TRUE, nrep=1000)
     
     # compute declination probabilities
     simu20.ds.dec <- decline(simu20.ds)
     
     summary(simu20.ds.dec)
     
     



