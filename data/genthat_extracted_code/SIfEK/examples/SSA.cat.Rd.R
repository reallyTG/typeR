library(SIfEK)


### Name: SSA.cat
### Title: Estimation of single catalytic constant using the stochastic
###   simulation approximation method
### Aliases: SSA.cat

### ** Examples

data("Chymo_low")
time1=Chymo_low[,1]
species1=Chymo_low[,2]
Chymotrypsin.low<-SSA.cat(method=TRUE,time=time1,species=species1,enz=4.4e+7,subs=4.4e+7
                 ,MM=4.4e+8, catal=0.1,nrepeat = 10000)



