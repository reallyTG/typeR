library(paleotree)


### Name: durationFreq
### Title: Models of Sampling and Extinction for Taxonomic Duration
###   Datasets
### Aliases: durationFreq make_durationFreqCont make_durationFreqDisc
###   make_durationFreqDisc

### ** Examples

#let's simulate some taxon ranges from an imperfectly sampled fossil record
set.seed(444)
record <- simFossilRecord(p = 0.1, q = 0.1, nruns = 1,
nTotalTaxa = c(30,40), nExtant = 0)
taxa <- fossilRecord2fossilTaxa(record)
rangesCont <- sampleRanges(taxa,r = 0.5)
#bin the ranges into discrete time intervals
rangesDisc <- binTimeData(rangesCont,int.length = 1)
#note that we made interval lengths = 1: 
 	# thus q (per int) = q (per time) for make_durationFreqDisc

## Not run: 
##D #old ways of doing it (defunct as of paleotree version 2.6)
##D getSampRateCont(rangesCont)
##D getSampProbDisc(rangesDisc)
## End(Not run)

#new ways of doing it
    # we can constrain our functions
    # we can use parInit, parLower and parUpper to control parameter bounds

#as opposed to getSampRateCont, we can do:
likFun <- make_durationFreqCont(rangesCont)
optim(parInit(likFun),likFun,lower = parLower(likFun),upper = parUpper(likFun),
      method = "L-BFGS-B",control = list(maxit = 1000000))

#as opposed to getSampProbDisc, we can do:
likFun <- make_durationFreqDisc(rangesDisc)
optim(parInit(likFun),likFun,lower = parLower(likFun),upper = parUpper(likFun),
     method = "L-BFGS-B",control = list(maxit = 1000000))

#these give the same answers (as we'd expect them to!)

#with newer functions we can constrain our functions easily
    # what if we knew the extinction rate = 0.1 a priori?
likFun <- make_durationFreqCont(rangesCont)
likFun <- constrainParPaleo(likFun,q.1~0.1)
optim(parInit(likFun),likFun,lower = parLower(likFun),upper = parUpper(likFun),
	    method = "L-BFGS-B",control = list(maxit = 1000000))

#actually decreases our sampling rate estimate
   # gets further away from true generating value, r = 0.5 (geesh!)
   # but this *is* a small dataset...



