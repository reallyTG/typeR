library(PHYLOGR)


### Name: prcomp.phylog
### Title: Principal Components Analysis from Simulated Data Sets
### Aliases: prcomp.phylog
### Keywords: multivariate

### ** Examples

data(SimulExample)
ex1.prcomp <- prcomp.phylog(SimulExample[,-11]) # 11th col. is a factor
options(digits=5)
ex1.prcomp
summary(ex1.prcomp)
plot(ex1.prcomp)



