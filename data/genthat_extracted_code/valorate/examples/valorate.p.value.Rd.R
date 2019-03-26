library(valorate)


### Name: valorate.p.value
### Title: ESTIMATES THE P-VALUE OF THE LOG-RANK TEST
### Aliases: valorate.p.value valorate.p.value.sampling
###   valorate.p.value.normal valorate.p.value.chisq
###   valorate.p.value.gaussian valorate.p.value.weibull
###   valorate.p.value.beta valorate.p.value.all

### ** Examples

## Create a random population of 100 subjects 
## having 20 events
subjects <- numeric(100)
subjects[sample(100,20)] <- 1
vo <- new.valorate(rank=subjects, sampling.size=100000, verbose=TRUE)

groups <- numeric(100)
groups[sample(100,4)] <- 1  # only 4 subjects are within the 'mutated' group
pvr <- valorate.survdiff(vo, groups)
print(pvr)

# the same than the value of pvr
valorate.p.value.sampling(vo, vo@subpop[["subpop4"]], attributes(pvr)[[1]]["LR"])

# the same than the value of pvr
valorate.p.value.sampling(vo, 4, attributes(pvr)[[1]]["LR"])

#classical approximations:
valorate.p.value.normal(vo, 4, attributes(pvr)[[1]]["LR"], attributes(pvr)[[1]]["Z"])
valorate.p.value.chisq(vo, 4, attributes(pvr)[[1]]["LR"], attributes(pvr)[[1]]["Z"])

# approximations of the conditional log-rank sampled density
valorate.p.value.gaussian(vo, 4, attributes(pvr)[[1]]["LR"])
valorate.p.value.beta(vo, 4, attributes(pvr)[[1]]["LR"])
valorate.p.value.weibull(vo, 4, attributes(pvr)[[1]]["LR"])

# all above can be get by:
valorate.p.value.all(vo, 4, attributes(pvr)[[1]]["LR"], attributes(pvr)[[1]]["Z"])

# Estimate a p-value a given log-rank
prepare.n1(vo, 50)
valorate.p.value.all(vo, 50, 0, 0) # 0 log-rank, 0 z-score




