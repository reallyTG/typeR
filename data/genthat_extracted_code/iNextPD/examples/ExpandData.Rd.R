library(iNextPD)


### Name: ExpandData
### Title: Expand branch abundance/incience and branch length
### Aliases: ExpandData

### ** Examples

data(bird)
bird.abu <- bird$abun
bird.inc <- bird$inci
bird.lab <- rownames(bird$abun)
bird.phy <- ade4::newick2phylog(bird$tre)
ExpandData(bird.abu, labels=bird.lab, phy=bird.phy, datatype="abundance")
ExpandData(bird.inc, labels=bird.lab, phy=bird.phy, datatype="incidence_raw")



