library(SimuChemPC)


### Name: predictChemPC
### Title: predictChemPC
### Aliases: predictChemPC 'predictChemPC, character list, character list,
###   vector, character list, vector'
### Keywords: predict, prediction, chemical, potent compounds, constraint
###   global optimization, expected potency improvement, gaussian process

### ** Examples

x = as.data.frame(array(1:100, dim=c(20,5)))
y = as.matrix(as.numeric(array(1:20, dim=c(20,1))))
xstar = as.data.frame(array(5:105, dim=c(20,5)))
loghyper = trainChemPC(x, y)
index = predictChemPC(x, y, xstar, loghyper, method="RA")



