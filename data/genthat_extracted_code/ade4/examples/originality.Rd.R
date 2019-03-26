library(ade4)


### Name: originality
### Title: Originality of a species
### Aliases: originality
### Keywords: multivariate

### ** Examples

data(carni70)
carni70.phy <- newick2phylog(carni70$tre)
ori.tab <- originality(carni70.phy, 1:7)
names(ori.tab)
dotchart.phylog(carni70.phy, ori.tab, scaling = FALSE, yjoining = 0, 
    ranging = FALSE, cleaves = 0, ceti = 0.5, csub = 0.7, cdot = 0.5)



