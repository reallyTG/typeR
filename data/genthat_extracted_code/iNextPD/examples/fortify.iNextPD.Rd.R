library(iNextPD)


### Name: fortify.iNextPD
### Title: Fortify method for classes from the iNextPD package.
### Aliases: fortify.iNextPD

### ** Examples

# single-assemblage abundance data
data(bird)
bird.lab <- rownames(bird$abun)
bird.phy <- ade4::newick2phylog(bird$tre)
out1 <- iNextPD(bird$abun$North.site, bird.lab, bird.phy, 
        q=0, datatype="abundance", endpoint=400)
ggplot2::fortify(out1, type=1)



