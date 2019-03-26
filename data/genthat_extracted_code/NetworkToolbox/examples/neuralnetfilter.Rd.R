library(NetworkToolbox)


### Name: neuralnetfilter
### Title: Neural Network Filter
### Aliases: neuralnetfilter

### ** Examples

## Not run: 
##D neuralarray <- convertConnBrainMat()
##D 
##D filteredneuralarray <- neuralnetfilter(neuralarray, method = "threshold", thresh = .50)
##D 
##D dependencyarray <- depna(neuralarray)
##D 
##D filtereddependencyarray <- neuralnetfilter(dependencyarray, method = "TMFG", depend = TRUE)
## End(Not run)




