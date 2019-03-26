library(epanetReader)


### Name: plotInpNodes
### Title: Plot Node Elements
### Aliases: plotInpNodes

### ** Examples

## make a new blank plot 
plot( range(Net1$Coordinates$X), range(Net1$Coordinates$Y), type = 'n') 
## add the nodes, including junctions 
plotInpNodes(Net1, TRUE ) 



