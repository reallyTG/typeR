library(nat)


### Name: potential_synapses
### Title: Calculate number of potential synapses between two neurons
### Aliases: potential_synapses potential_synapses.neuronlist
###   potential_synapses.neuron potential_synapses.dotprops

### ** Examples

potential_synapses(Cell07PNs[1], Cell07PNs[1:3], s=2)
## Not run: 
##D # if you have many neurons to calculate you should get a progress bar 
##D potential_synapses(Cell07PNs[1:10], Cell07PNs[11:20], s=2)
##D 
##D # you can also use parallel execution, here over 7 cores
##D # doMC::registerDoMC(7)
##D potential_synapses(Cell07PNs[1:10], Cell07PNs[11:20], s=2, .parallel=TRUE)
## End(Not run)



