library(NTS)


### Name: simu_fading
### Title: Simulate Signals from A System with Rayleigh Flat-Fading
###   Channels
### Aliases: simu_fading

### ** Examples

HH <- matrix(c(2.37409, -1.92936, 0.53028,0,1,0,0,0,0,1,0,0,0,0,1,0),ncol=4,byrow=TRUE)
WW <- matrix(c(1,0,0,0),nrow=4)
GG <- matrix(0.01*c(0.89409,2.68227,2.68227,0.89409),nrow=1)
VV <- 1.3**15*0.001
par <- list(HH=HH,WW=WW,GG=GG,VV=VV)
set.seed(1)
simu <- simu_fading(200,par)



