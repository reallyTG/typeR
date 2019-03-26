library(iNextPD)


### Name: bird
### Title: Bird phylogeny and survey data
### Aliases: bird
### Keywords: datasets

### ** Examples

data(bird)
bird.phy <- ade4::newick2phylog(bird$tre)
plot(bird.phy)
bird.abun <- bird$abun
bird.lab <- rownames(bird$abun)
ade4::table.phylog(bird.abun, bird.phy, csize=4, f.phylog=0.7)



