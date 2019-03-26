library(nat)


### Name: write.neuron
### Title: Write out a neuron in any of the file formats we know about
### Aliases: write.neuron

### ** Examples

# show the currently registered file formats that we can write
fileformats(class='neuron', write=TRUE)
## Not run: 
##D write.neuron(Cell07PNs[[1]], file='myneuron.swc')
##D # writes out "myneuron.swc" in SWC format
##D write.neuron(Cell07PNs[[1]], format = 'hxlineset', file='myneuron.amiramesh')
##D # writes out "myneuron.amiramesh" in Amira hxlineset format
##D write.neuron(Cell07PNs[[1]], format = 'hxlineset', file='myneuron')
##D # writes out "myneuron.am" in Amira hxlineset format
## End(Not run)



