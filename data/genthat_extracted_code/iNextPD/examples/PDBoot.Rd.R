library(iNextPD)


### Name: PDBoot
### Title: Expand bootstraping branch abundance/incience and branch length
### Aliases: PDBoot

### ** Examples

data(bird)
bird.lab <- rownames(bird$abun)
bird.phy <- ade4::newick2phylog(bird$tre)
bird.inc <- bird$inci
PDBoot(bird.inc, labels=bird.lab, phy=bird.phy, datatype="incidence_raw")




