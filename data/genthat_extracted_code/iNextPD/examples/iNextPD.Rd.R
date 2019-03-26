library(iNextPD)


### Name: iNextPD
### Title: iNterpolation and EXTrapolation of Hill number
### Aliases: iNextPD

### ** Examples

data(bird)
bird.abu <- bird$abun
bird.lab <- rownames(bird$abun)
bird.phy <- ade4::newick2phylog(bird$tre)
iNextPD(bird.abu, labels=bird.lab, phy=bird.phy, q=0, datatype="abundance")



