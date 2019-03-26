library(adegenet)


### Name: pairDistPlot
### Title: Pairwise distance plots
### Aliases: pairDist pairDist.default pairDistPlot pairDistPlot.default
###   pairDistPlot.dist pairDistPlot.matrix pairDistPlot.genind
###   pairDistPlot.DNAbin

### ** Examples

## Not run: 
##D 
##D ## use a subset of influenza data
##D data(H3N2)
##D set.seed(1)
##D dat <- H3N2[sample(1:nInd(H3N2), 100)]
##D 
##D ## get pairwise distances
##D temp <- pairDistPlot(dat, other(dat)$epid)
##D 
##D ## see raw data
##D head(temp$data)
##D 
##D ## see plots
##D temp$boxplot
##D temp$violin
##D temp$jitter
##D 
## End(Not run)



