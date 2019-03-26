library(paleotree)


### Name: constrainParPaleo
### Title: Constrain Parameters for a Model Function from paleotree
### Aliases: constrainParPaleo

### ** Examples

#simulation example with make_durationFreqCont, with three random groups
set.seed(444)
record <- simFossilRecord(p = 0.1, q = 0.1, nruns = 1,
nTotalTaxa = c(30,40), nExtant = 0)
taxa <- fossilRecord2fossilTaxa(record)
rangesCont <- sampleRanges(taxa,r = 0.5)
grp1 <- matrix(sample(1:3,nrow(taxa),replace = TRUE),,1)   #groupings matrix
likFun <- make_durationFreqCont(rangesCont,groups = grp1)

# can constrain both extinction rates to be equal
constrainFun <- constrainParPaleo(likFun,q.2~q.1)

#see the change in parameter names and bounds
parnames(likFun)
parnames(constrainFun)
parbounds(likFun)
parbounds(constrainFun)

# some more ways to constrain stuff!

#constrain all extinction rates to be equal
constrainFun <- constrainParPaleo(likFun,q.all~q.1)
parnames(constrainFun)

#constrain all rates for everything to be a single parameter
constrainFun <- constrainParPaleo(likFun,r.all~q.all)
parnames(constrainFun)

#constrain all extinction rates to be equal & all sampling to be equal
constrainFun <- constrainParPaleo(likFun,q.all~q.1,r.all~r.1)
parnames(constrainFun)

#similarly, can use match.all to make all matching parameters equal each other
constrainFun <- constrainParPaleo(likFun,match.all~match.all)
parnames(constrainFun)

#Constrain rates in same group to be equal
constrainFun <- constrainParPaleo(likFun,r.match~q.match)
parnames(constrainFun)




