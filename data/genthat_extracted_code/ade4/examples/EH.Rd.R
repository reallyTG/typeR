library(ade4)


### Name: EH
### Title: Amount of Evolutionary History
### Aliases: EH
### Keywords: multivariate

### ** Examples

data(carni70)
carni70.phy <- newick2phylog(carni70$tre)
EH(carni70.phy)
EH(carni70.phy, select = 1:15) # Felidae



