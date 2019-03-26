library(DOBAD)


### Name: BDloglikelihood.PO
### Title: Calculate log likelihood of Partially Observed BD process
### Aliases: BDloglikelihood.PO BDloglikelihood.PO.CTMC_PO_1
###   BDloglikelihood.PO.CTMC_PO_many BDloglikelihood.PO.list

### ** Examples

library(DOBAD)
T=25;
L <- .3
mu <- .6
beta.immig <- 1.2;
initstate <- 17;

#generate process
dat <- birth.death.simulant(t=T, lambda=L, m=mu, nu=L*beta.immig, X0=initstate);
#"observe" process
delta <- 2
partialData <- getPartialData( seq(0,T,delta), dat);
#calculate the likelihood
BDloglikelihood.PO(partialDat=partialData, L=L, m=mu, nu=beta.immig*L);



