library(ade4)


### Name: njplot
### Title: Phylogeny and trait of bacteria
### Aliases: njplot
### Keywords: datasets

### ** Examples

data(njplot)
njplot.phy <- newick2phylog(njplot$tre)
par(mfrow = c(2,1))
tauxcg0 <- njplot$tauxcg - mean(njplot$tauxcg)
symbols.phylog(njplot.phy, squares = tauxcg0)
symbols.phylog(njplot.phy, circles = tauxcg0)
par(mfrow = c(1,1))



