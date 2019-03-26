library(EKMCMC)


### Name: MM_catal_est
### Title: Simulataneous estimation of Michaelis-Menten constant and
###   catalytic constant
### Aliases: MM_catal_est

### ** Examples

data("Chymo_low")
time1=Chymo_low[,1]
species1=Chymo_low[,2]
Chymotrypsin.low<-MM_catal_est(method=TRUE, time=time1,species=species1,enz=4.4e+7
,subs=4.4e+7,MM=1e+9,catal=0.01,tun=2.4,std=8e+7,nrepeat=1000,jump=10,
burning=0,catal_m=1,catal_v=1e+10, MM_m=1e+9,MM_v=1e+18)



