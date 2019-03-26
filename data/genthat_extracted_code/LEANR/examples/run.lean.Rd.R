library(LEANR)


### Name: run.lean
### Title: Run the LEAN approach
### Aliases: lean run.lean

### ** Examples

## Simple use case starting from a test network and p-value list
## Not run: 
##D  
##D # compute LEAN p-values starting from a p-value file and a network file
##D rank_file<-system.file('extdata/pvals_red.txt.gz', package='LEANR')
##D net_file<-system.file('extdata/g_red.sif.gz', package='LEANR')
##D system.time(res<-run.lean(ranking=rank_file, network=net_file, 
##D   add.scored.genes=T, verbose=T, n_reps=1000, ncores=3))
##D 
##D # compute LEAN p-values starting from a list of gene scores and a graph
##D data(pvals_red)
##D data(g_red)
##D system.time(res2<-run.lean(ranking=pvals_red, network=g_red, verbose=T, 
##D    n_reps=1000, ncores=3))
##D 
## End(Not run) 



