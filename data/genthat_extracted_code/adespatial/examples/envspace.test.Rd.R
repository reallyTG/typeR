library(adespatial)


### Name: envspace.test
### Title: Perform a test of the shared space-environment fraction of a
###   variation partitioning using torus-translation (TT) or Moran Spectral
###   Randomisation (MSR)
### Aliases: envspace.test
### Keywords: spatial

### ** Examples

## Not run: 
##D if(require(vegan)) { 
##D # Illustration of the test of the SSEF on the oribatid mite data
##D # (Borcard et al. 1992, 1994 for details on the dataset):
##D # Community data (response matrix):
##D data(mite)
##D # Hellinger-transformation of the community data (Legendre and Gallagher 2001):
##D Y <- decostand(mite, method = "hellinger")
##D # Environmental explanatory dataset:
##D data(mite.env)
##D # We only use two numerical explanatory variables:
##D env <- mite.env[, 1:2]
##D dim(Y)
##D dim(env)
##D # Coordinates of the 70 sites:
##D data(mite.xy)
##D coord <- mite.xy
##D 
##D ### Building a list of candidate spatial weighting matrices (SWMs) for the 
##D ### optimisation of the SWM selection, separately for 'Y' and 'env':
##D # We create five candidate SWMs: a connectivity matrix based on a Gabriel graphs, on
##D # a minimum spanning tree (i.e., two contrasted graph-based SWMs), either
##D # not weighted, or weighted by a linear function decreasing with the distance),
##D # and a distance-based SWM corresponding to the connectivity and weighting
##D # criteria of the original PCNM method:
##D candidates <- listw.candidates(coord, nb = c("gab", "mst", "pcnm"), weights = c("binary",
##D                                                                                 "flin"))
##D ### Optimisation of the selection of a SWM:
##D # SWM for 'Y' (based on the best forward-selected subset of MEM variables):
##D modsel.Y <- listw.select(Y, candidates, method = "FWD", MEM.autocor = "positive",
##D                          p.adjust = TRUE)
##D                          
##D names(candidates)[modsel.Y$best.id]                 # Best SWM selected
##D modsel.Y$candidates$Pvalue[modsel.Y$best.id]        # Adjusted p-value of the global model
##D modsel.Y$candidates$N.var[modsel.Y$best.id]         # Nb of forward-selected MEM variables
##D modsel.Y$candidates$R2Adj.select[modsel.Y$best.id]  # Adjusted R2 of the selected MEM var.
##D 
##D # SWM for 'env' (method = "global" for the optimisation, as all MEM variables are required
##D # to use MSR):
##D modsel.env <- listw.select(env, candidates, method = "global", MEM.autocor = "positive",
##D                            p.adjust = TRUE)
##D 
##D names(candidates)[modsel.env$best.id]                  # Best SWM selected
##D modsel.env$candidates$Pvalue[modsel.env$best.id]       # Adjusted p-value of the global model
##D modsel.env$candidates$N.var[modsel.env$best.id]        # Nb of forward-selected MEM variables
##D modsel.env$candidates$R2Adj.select[modsel.env$best.id] # Adjusted R2 of the selected MEM var.
##D 
##D ### We perform the variation partitioning:
##D # Subset of selected MEM variables within the best SWM:
##D MEM.spe <- modsel.Y$best$MEM.select
##D 
##D VP <- varpart(Y, env, MEM.spe)
##D plot(VP)
##D 
##D # Test of the shared space-environment fraction (fraction [b]):
##D SSEF.test <- envspace.test(Y, env, coord, MEM.spe, 
##D                            listw.env = candidates[[modsel.env$best.id]], 
##D                            regular = FALSE, nperm = 999)
##D SSEF.test
##D 
##D # The SSEF is highly significant, indicating a potential induced spatial dependence.
##D }
## End(Not run)



