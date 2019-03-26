library(SimuChemPC)


### Name: SimuChemPC
### Title: SimuChemPC
### Aliases: SimuChemPC 'SimuChemPC, character list, character list,
###   character list, character list,integer'
### Keywords: chemical, potent compounds, constraint global optimization,
###   expected potency improvement, gaussian process

### ** Examples

x = as.data.frame(array(1:100, dim=c(20,5)))
y = as.matrix(as.numeric(array(1:20, dim=c(20,1))))
SimuChemPC(x, y, "RA", 5)



