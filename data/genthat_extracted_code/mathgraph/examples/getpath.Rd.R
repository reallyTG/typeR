library(mathgraph)


### Name: getpath
### Title: Find a Path in a Mathematical Graph
### Aliases: getpath getpath.mathgraph getpath.incidmat getpath.adjamat
###   getpath.default
### Keywords: math

### ** Examples

getpath(mathgraph(~ 1:3 / 3:5), 1, 5) # returns a path
getpath(mathgraph(~ 1:3 / 3:5), 1, 4) # no path, returns NULL
getpath(mathgraph(~ 1:3 / 3:5), 1, 1) # returns mathgraph()




