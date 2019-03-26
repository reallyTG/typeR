library(SimuChemPC)


### Name: trainChemPC
### Title: trainChemPC
### Aliases: trainChemPC 'trainChemPC, character list, character list'
### Keywords: train, chemical, potent compounds, constraint global
###   optimization, expected potency improvement, gaussian process

### ** Examples

x = as.data.frame(array(1:100, dim=c(20,5)))
y = as.matrix(as.numeric(array(1:20, dim=c(20,1))))
loghyper = trainChemPC(x, y)



