library(paleotree)


### Name: inverseSurv
### Title: Inverse Survivorship Models in the Fossil Record
### Aliases: inverseSurv make_inverseSurv invSurv

### ** Examples

## No test: 

# let's simulate some taxon ranges from an imperfectly sampled fossil record
set.seed(444)
record <- simFossilRecord(p = 0.1, q = 0.1, nruns = 1,
nTotalTaxa = c(30,40), nExtant = 0)
taxa <- fossilRecord2fossilTaxa(record)
rangesCont <- sampleRanges(taxa,r = 0.5)
#bin the ranges into discrete time intervals
rangesDisc <- binTimeData(rangesCont,int.length = 5)

#apply make_inverseSurv
likFun <- make_inverseSurv(rangesDisc)
#use constrainParPaleo to make the model time-homogenous
  	#match.all~match.all will match parameters so only 2 pars: p = q and r
constrFun <- constrainParPaleo(likFun,match.all~match.all)
results <- optim(parInit(constrFun), constrFun,
      lower = parLower(constrFun), upper = parUpper(constrFun),
      method = "L-BFGS-B", control = list(maxit = 1000000))
results

#plot the results
constrFun(results$par, altMode = TRUE)

#unconstrained function with ALL of 225 parameters!!!
    # this will take forever to converge, so it isn't run
optim(parInit(likFun),likFun,lower = parLower(likFun),upper = parUpper(likFun),
      method = "L-BFGS-B",control = list(maxit = 1000000))
## End(No test)



