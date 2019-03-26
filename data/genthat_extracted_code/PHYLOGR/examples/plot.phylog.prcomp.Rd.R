library(PHYLOGR)


### Name: plot.phylog.prcomp
### Title: Plot a phylog.prcomp object
### Aliases: plot.phylog.prcomp
### Keywords: methods

### ** Examples


data(SimulExample)
ex1.prcomp <- prcomp.phylog(SimulExample[,-11]) # 11th column is a factor
options(digits=5)
plot(ex1.prcomp)



