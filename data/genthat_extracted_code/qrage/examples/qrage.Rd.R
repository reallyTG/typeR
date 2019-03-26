library(qrage)


### Name: qrage
### Title: Create a D3 JavaScript Force Directed Graph
### Aliases: qrage

### ** Examples

#Data to determine the connection between the nodes
data(links)

#Data that determines the color of the nodes
data(nodeColor)

#Data that determines the size of the node
data(nodeValues)

#Create graph
qrage(links=links,nodeColor=nodeColor,nodeValue=nodeValues,cut=0.1)



