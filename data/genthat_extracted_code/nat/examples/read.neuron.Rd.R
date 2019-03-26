library(nat)


### Name: read.neuron
### Title: Read a single neuron from a file
### Aliases: read.neuron

### ** Examples

## Not run: 
##D # note that we override the default NeuronName field
##D n=read.neuron(system.file("tests/testthat/testdata","neuron","EBT7R.CNG.swc",package='nat'),
##D   NeuronName="EBT7R")
##D # use a function to set the NeuronName field
##D n3=read.neuron(system.file("tests/testthat/testdata","neuron","EBT7R.CNG.swc",package='nat'),
##D   NeuronName=function(x) sub("\\..*","",x))
##D # show the currently registered file formats that we can read
##D fileformats(class='neuron', read=TRUE)
## End(Not run)



