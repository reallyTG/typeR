library(EKMCMC)


### Name: fore_p
### Title: Simulation plot of enzyme kinetics model
### Aliases: fore_p

### ** Examples

data("Chymo_low")
time1=Chymo_low[,1]
species1=Chymo_low[,2]
fore_p(method=TRUE, CL=TRUE, time=time1,species=species1,enz=4.4e+7, subs=4.4e+7
       ,MM=4.4e+8, catal=.051)



