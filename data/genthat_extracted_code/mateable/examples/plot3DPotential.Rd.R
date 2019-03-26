library(mateable)


### Name: plot3DPotential
### Title: graphical visualization of multiple mating potential objects
### Aliases: plot3DPotential

### ** Examples

pop <- simulateScene()
sync <- synchrony(pop, "augs")
prox <- proximity(pop, 'maxProp')
compat <- compatibility(pop, 'si_echinacea')
plot3DPotential(list(sync,prox,compat), subject = 'ind')



