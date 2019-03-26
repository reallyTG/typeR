library(spa)


### Name: spa.sim
### Title: Simulated data for SPA
### Aliases: spa.sim
### Keywords: classes models methods

### ** Examples

set.seed(100)
dat=spa.sim(type="moon") 

L=which(!is.na(dat$y))
U=which(is.na(dat$y))

##Fit data
gsemi<-spa(dat$y,graph=as.matrix(daisy(dat[,-1])))
gsemi



