library(nat)


### Name: find.neuron
### Title: Find neurons within a 3D selection box (usually drawn in rgl
###   window)
### Aliases: find.neuron

### ** Examples

## Not run: 
##D plot3d(kcs20)
##D # draw a 3D selection e.g. around tip of vertical lobe when ready
##D find.neuron(db=kcs20)
##D # would return 9 neurons
##D # make a standalone selection function
##D vertical_lobe=select3d()
##D find.neuron(vertical_lobe, db=kcs20)
##D # use base::Negate function to invert the selection function 
##D # i.e. choose neurons that do not overlap the selection region
##D find.neuron(Negate(vertical_lobe), db=kcs20)
## End(Not run)



