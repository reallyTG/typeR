library(nat)


### Name: all.equal.neuron
### Title: Check equality on key fields of neuron object
### Aliases: all.equal.neuron

### ** Examples

x=Cell07PNs[[1]]
y=x
y$NeuronName='rhubarb'
# NOT TRUE
all.equal(x, y)
# TRUE
all.equal(x, y, fieldsToExclude='NeuronName')



