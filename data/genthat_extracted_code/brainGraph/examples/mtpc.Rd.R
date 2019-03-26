library(brainGraph)


### Name: mtpc
### Title: Multi-threshold permutation correction
### Aliases: mtpc summary.mtpc

### ** Examples

## Not run: 
##D diffs.mtpc <- mtpc(g.list=g.norm, thresholds=thresholds, N=N,
##D      covars=covars.dti, measure='E.nodal.wt', coding='effects',
##D      con.mat=c(0, 0, 0, 0, -2), alt='greater',
##D      binarize=c('Sex', 'Scanner'), con.name='Group 1 > Group 2')
##D sig.regions <- diffs.mtpc$DT[A.mtpc > A.crit]
## End(Not run)



