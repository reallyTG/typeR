library(iNextPD)


### Name: estPD
### Title: Estimate asymptotic phylogenetic diversity
### Aliases: estPD

### ** Examples

# abundance-based example
data(bird)
bird.abu <- bird$abun
bird.lab <- rownames(bird$abun)
bird.phy <- ade4::newick2phylog(bird$tre)
estPD(bird.abu, labels=bird.lab, phy=bird.phy, q=0, datatype="abundance")

# incidence_based example
bird.inc <- bird$inci
estPD(bird.inc, labels=bird.lab, phy=bird.phy, q=0, datatype="incidence_raw", se=TRUE)



