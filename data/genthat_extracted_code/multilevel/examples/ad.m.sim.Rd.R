library(multilevel)


### Name: ad.m.sim
### Title: Simulate significance of average deviation around mean or median
### Aliases: ad.m.sim
### Keywords: attribute

### ** Examples

#Example from Dunlap et al. (2003), Table 3.  The listed significance
#value (p=.05) for a group of size 5 with a 7-item response format is
#0.64 or less
 
SIMOUT<-ad.m.sim(gsize=5, nitems=1, nresp=7, itemcors=NULL,
        type="mean", nrep=1000) 
summary(SIMOUT)

#Example with a multiple item scale basing item correlations on observed
#correlations among 11 leadership items in the lq2002 data set.  Estimate
#in Cohen et al., (2009) is 0.99

library(MASS)
data(lq2002)
SIMOUT<-ad.m.sim(gsize=10, nresp=5, itemcors=cor(lq2002[,3:13]), 
        type="mean", nrep=1000) 
summary(SIMOUT)
quantile(SIMOUT,c(.05,.10))



