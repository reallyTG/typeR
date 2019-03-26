library(sigmaNet)


### Name: saveSigma
### Title: Save 'sigmaNet' object as html - a wrapper for saveWidget()
### Aliases: saveSigma

### ** Examples

library(igraph)
library(sigmaNet)
library(magrittr)

data(lesMis)

l <- layout_nicely(lesMis)
sig <- sigmaFromIgraph(graph = lesMis, layout = l)

## Not run: 
##D saveSigma(sig, fileName = file.path(tempdir(), 'myFile.html'))
## End(Not run)




