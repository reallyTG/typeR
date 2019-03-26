library(brainGraph)


### Name: brainGraph_GLM
### Title: Fit linear models at each vertex of a graph
### Aliases: brainGraph_GLM

### ** Examples

## Not run: 
##D conmat <- matrix(c(0, 0, 0, 1), nrow=1)
##D rownames(conmat) <- 'Control > Patient'
##D 
##D ## Note that I concatenate the graphs from each group's 6th threshold
##D g.lm <- brainGraph_GLM(g.list=do.call(Map, c(c, g))[[6]],
##D   covars=covars.all[tract == 1],
##D   measure='strength', con.mat=conmat, alt='greater',
##D   permute=TRUE, long=TRUE)
## End(Not run)



