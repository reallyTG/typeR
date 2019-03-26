library(ndtv)


### Name: filmstrip
### Title: Create a 'small multiples' plot of a networkDynamic object.
### Aliases: filmstrip

### ** Examples

data(stergm.sim.1)
filmstrip(stergm.sim.1,displaylabels=FALSE)
# print an overall title for the main plot
title('stergm.sim.1 at 9 time points')

# adjust margins of individual plots to make more room
par(mar=c(1,1,1,1))
filmstrip(stergm.sim.1)



