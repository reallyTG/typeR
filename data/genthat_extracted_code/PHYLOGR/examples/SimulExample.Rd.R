library(PHYLOGR)


### Name: SimulExample
### Title: A simulated data set
### Aliases: SimulExample
### Keywords: datasets

### ** Examples

# a canonical correlation example
data(SimulExample)
ex1.cancor <- cancor.phylog(SimulExample[,c(1,2,3,4,5)],SimulExample[,c(1,2,6,7,8)])
ex1.cancor
summary(ex1.cancor)
plot(ex1.cancor)



