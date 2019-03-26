library(InteractiveIGraph)


### Name: InteractiveIGraph
### Title: Interactive igraph
### Aliases: InteractiveIGraph InteractiveIGraph.Constructor
###   plot.InteractiveIGraph as.igraph.InteractiveIGraph

### ** Examples


# this is a regular igraph object
gOrg <- erdos.renyi.game(15, 1/10,  directed = TRUE)
plot(gOrg) 

# this is an 'InteractiveIGraph' object, up till now there is not much difference. Just some extra attributes.
g = InteractiveIGraph.Constructor(gOrg)
g = plot(g) 

# now it is interactive. Please enjoy :)
if(interactive()){
  g = InteractiveIGraph(gOrg)
}
# p.s. if you want to save changes please press 'q' while ruining InteractiveIGraph().

# Select some vertices and apply commands, for example 'a', 'A', or 'g', 'b'.
# you may change any attributes by key 'ctrl-F' and then typing attributes command, 
# for example 'color="green"'
# (it will work only on selected vertices).

# you may run any command by key 'ctrl-C' and typing command, for example 'print(V(g)$name)'

# with key 's' you can change selection mode - in this way you can select multiple vertices. 




