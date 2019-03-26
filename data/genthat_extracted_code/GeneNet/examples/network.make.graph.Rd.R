library(GeneNet)


### Name: network.make.graph
### Title: Graphical Gaussian Models: Plotting the Network
### Aliases: network.make.graph network.make.dot node.degree edge.info
###   num.nodes
### Keywords: hplot

### ** Examples

# load GeneNet library
library("GeneNet")
 
# generate random network with 20 nodes and 10 percent edges (=19 edges)
true.pcor <- ggm.simulate.pcor(20, 0.1)

# convert to edge list 
test.results <- ggm.list.edges(true.pcor)[1:19,]

########  use graphviz directly to produce a plot ##########

# uncomment for actual use!

# nlab <- LETTERS[1:20]
# ggm.make.dot(filename="test.dot", test.results, nlab, main = "A graph") 
# system("fdp -T svg -o test.svg test.dot") # SVG format


########  use Rgraphviz produce a plot ##########

# uncomment for actual use!

# nlab <- LETTERS[1:20]
# gr <- network.make.graph( test.results, nlab) 
# gr 
# num.nodes(gr)
# edge.info(gr)
# gr2 <- network.make.graph( test.results, nlab, drop.singles=TRUE) 
# gr2 
# num.nodes(gr2)
# edge.info(gr2)

# plot network
# NOTE: this requires the installation of the "Rgraphviz" library
# library("Rgraphviz")
# plot(gr, "fdp")
# plot(gr2, "fdp")

## for a full example with beautified Rgraphviz plot see 
## the example scripts provide with GeneNet (e.g. arabidopis-net.R)





