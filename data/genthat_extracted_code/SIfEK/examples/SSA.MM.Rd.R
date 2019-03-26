library(SIfEK)


### Name: SSA.MM
### Title: Estimation of single Michaelis-Menten constant using the
###   stochastic simulation approximation
### Aliases: SSA.MM

### ** Examples

data("Chymo_low")
time1=Chymo_low[,1]
species1=Chymo_low[,2]
 Chymotrypsin.mm<-SSA.MM(method=TRUE,time=time1,species=species1,enz=4.4e+7,subs=4.4e+7
 ,MM=10000,catal=0.051,tun=2.4,std=8e+7 ,nrepeat=10000,jump=1
 ,burning=0,MM_m=1,MM_v=1e+10)



