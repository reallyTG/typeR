library(iNextPD)


### Name: estimatePD
### Title: Compute phylogenetic diversity with a particular of sample
###   size/coverage
### Aliases: estimatePD

### ** Examples

data(bird)
bird.abu <- bird$abun
bird.lab <- rownames(bird$abun)
bird.phy <- ade4::newick2phylog(bird$tre)
estimatePD(bird.abu, bird.lab, bird.phy, "abundance", base="size", level=NULL, conf=NULL)
## Not run: 
##D estimatePD(bird.abu, bird.lab, bird.phy, "abundance", base="size", level=NULL)
## End(Not run)



