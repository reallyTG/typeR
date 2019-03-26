library(revengc)


### Name: reweight.univariatetable
### Title: Reweighting a univariate table
### Aliases: reweight.univariatetable

### ** Examples

# use preloaded univariate table for observed table 
observed.table<-univariatetable.csv

# estimate parameters from observed table
pars=cnbinom.pars(observed.table)
mu=pars$Average
r = pars$Dispersion

# create estimated table 
# truncated negative binomial probabilities
# uncensored range is from 1:15 
library(truncdist)
estimated.table<-dtrunc(1:15, size = r, mu = mu, spec = "nbinom", a = 1-1, b = 15)
names(estimated.table)<-1:15

# reweight observed table to estimated table
results<-reweight.univariatetable(observed.table, estimated.table)

# check results for >=9 
reweightedresults<-sum(results[9:15])
# observed.table$V2[5] = 4.1
observedresults<-observed.table$V2[5]/sum(observed.table$V2)  
# matching probabilities
all.equal(reweightedresults, observedresults)



