library(stratification)


### Name: strata.bh
### Title: Stratification of a Population Given a Set of Boundaries
### Aliases: strata.bh
### Keywords: survey

### ** Examples

adjust <- strata.geo(x=USbanks, CV=0.01, Ls=4, alloc=c(0.35,0.35,0))
adjust
adjust$nhnonint
noadjust <- strata.bh(x=USbanks, bh=adjust$bh, CV=0.01, Ls=4,
            alloc=c(0.35,0.35,0), takeall=0, takeall.adjust=FALSE)
noadjust
noadjust$nhnonint
# without the adjustment for a take-all stratum, n is smaller than
# with the adjustment, but the target CV is not reached.



