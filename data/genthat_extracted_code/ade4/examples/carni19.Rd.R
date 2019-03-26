library(ade4)


### Name: carni19
### Title: Phylogeny and quantative trait of carnivora
### Aliases: carni19
### Keywords: datasets

### ** Examples

data(carni19)
carni19.phy <- newick2phylog(carni19$tre)
par(mfrow = c(1,2))
symbols.phylog(carni19.phy,carni19$bm-mean(carni19$bm))
dotchart.phylog(carni19.phy, carni19$bm, clabel.l=0.75)
par(mfrow = c(1,1))



