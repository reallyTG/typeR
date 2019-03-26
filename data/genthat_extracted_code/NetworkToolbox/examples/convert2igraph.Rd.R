library(NetworkToolbox)


### Name: convert2igraph
### Title: Convert Network(s) to igraph's Format
### Aliases: convert2igraph

### ** Examples

A <- TMFG(neoOpen)$A

igraphNetwork <- convert2igraph(A)

## Not run: 
##D  
##D neuralarray <- convertConnBrainMat()
##D 
##D igraphNeuralList <- convert2igraph(neuralarray, neural = TRUE)
## End(Not run)




