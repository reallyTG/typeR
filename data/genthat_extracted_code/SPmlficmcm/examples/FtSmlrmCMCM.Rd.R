library(SPmlficmcm)


### Name: FtSmlrmCMCM
### Title: Generates the logistic model data
### Aliases: FtSmlrmCMCM
### Keywords: Simulation

### ** Examples

# 1-Creation of database
  set.seed(13200)
   M=5000
   fl=outc~X1+X2+gm+gc+X2:gm
   vpo=c(3,4)
   vprob=c(0.35,0.55)
   vcorr=c(2,1)
   theta=0.3;
   beta=c(-0.916,0.857,0.405,-0.693,0.573)
   interc=-2.23
   Dataf<-FtSmlrmCMCM(fl,M,theta,beta,interc,vpo,vprob,vcorr)
   Dataf[1:10,]



