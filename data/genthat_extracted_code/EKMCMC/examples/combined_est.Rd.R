library(EKMCMC)


### Name: combined_est
### Title: Simulataneous estimation of Michaelis-Menten constant and
###   catalytic constant using combined data
### Aliases: combined_est

### ** Examples

data("Chymo_low")
time1=Chymo_low[,1]
species1=Chymo_low[,2]
data("Chymo_high")
time2=Chymo_high[,1]
species2=Chymo_high[,2]
enz.Chymotrypsin<-combined_est(method=TRUE, time1=time1 ,time2=time2 ,species1=species1
                               ,species2=species2,enz1=4.4e+7,enz2=4.4e+9
                               ,subs1=4.4e+7,subs2=4.4e+7,MM=1e+9,catal=0.01,
                               tun=2.0,std=8e+7,nrepeat=1000,jump=10,burning=0
                               ,catal_m=1,catal_v=1e+6, MM_m=1,MM_v=1e+10)



