library(SIfEK)


### Name: SSA.combi
### Title: Simultaneous estimation of Michaelis-Menten constant and
###   catalytic constant using combined data and the likelihood function
###   with the Stochastic Simulation Approximation method.
### Aliases: SSA.combi

### ** Examples

## Not run: 
##D data("Chymo_low")
##D time1=Chymo_low[,1]
##D species1=Chymo_low[,2]
##D data("Chymo_high")
##D time2=Chymo_high[,1]
##D species2=Chymo_high[,2]
##D enz.Chymotrypsin<-SSA.combi(method=TRUE, time1=time1 ,time2=time2 ,species1=species1
##D                                ,species2=species2,enz1=4.4e+7,enz2=4.4e+9
##D                                ,subs1=4.4e+7,subs2=4.4e+7,MM=1e+9,catal=0.01,
##D                                tun=2.0,std=8e+7,nrepeat=10000,jump=1,burning=0
##D                                ,catal_m=1,catal_v=1e+6, MM_m=1,MM_v=1e+10)
## End(Not run)



