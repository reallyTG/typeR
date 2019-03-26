library(SEMID)


### Name: SEMID-package
### Title: SEMID package documentation.
### Aliases: SEMID-package SEMID

### ** Examples

###
# Checking the generic identifiability of parameters in a mixed graph.
###

# Mixed graphs are specified by their directed adjacency matrix L and
# bidirected adjacency matrix O.
L = t(matrix(
 c(0, 1, 1, 0, 0,
   0, 0, 1, 1, 1,
   0, 0, 0, 1, 0,
   0, 0, 0, 0, 1,
   0, 0, 0, 0, 0), 5, 5))

O = t(matrix(
 c(0, 0, 0, 1, 0,
   0, 0, 1, 0, 1,
   0, 0, 0, 0, 0,
   0, 0, 0, 0, 0,
   0, 0, 0, 0, 0), 5, 5)); O=O+t(O)

# Create a mixed graph object
graph = MixedGraph(L, O)

# We can plot what this mixed graph looks like, blue edges are directed
# red edges are bidirected.
plot(graph)

# Without using decomposition techniques we can't identify all nodes
# just using the half-trek criterion
htcID(graph, tianDecompose = FALSE)

# The edgewiseTSID function can show that all edges are generically
# identifiable without proprocessing with decomposition techniques
edgewiseTSID(graph, tianDecompose = FALSE)

# The above shows that all edges in the graph are generically identifiable.
# See the help of edgewiseTSID to find out more information about what
# else is returned by edgewiseTSID.

###
# Checking generic parameter identifiability using the generalGenericID
# function
###

L = t(matrix(
 c(0, 1, 0, 0, 0,
   0, 0, 0, 1, 1,
   0, 0, 0, 1, 0,
   0, 1, 0, 0, 1,
   0, 0, 0, 1, 0), 5, 5))

O = t(matrix(
 c(0, 0, 0, 0, 0,
   0, 0, 1, 0, 1,
   0, 0, 0, 1, 0,
   0, 0, 0, 0, 0,
   0, 0, 0, 0, 0), 5, 5)); O=O+t(O)

# Create a mixed graph object
graph = MixedGraph(L, O)

# Now lets define an "identification step" function corresponding to
# using the edgewise identification algorithm but with subsets
# controlled by 1.
restrictedEdgewiseIdentifyStep <- function(mixedGraph,
                                            unsolvedParents,
                                            solvedParents,
                                            identifier) {
     return(edgewiseIdentifyStep(mixedGraph, unsolvedParents,
                                 solvedParents, identifier,
                                 subsetSizeControl = 1))
}

# Now we run an identification algorithm that iterates between the
# htc and the "restricted" edgewise identification algorithm
generalGenericID(graph, list(htcIdentifyStep,
                               restrictedEdgewiseIdentifyStep),
	                 tianDecompose = FALSE)

# We can do better (fewer unsolved parents) if we don't restrict the edgewise
# identifier algorithm as much
generalGenericID(graph, list(htcIdentifyStep, edgewiseIdentifyStep),
                  tianDecompose = FALSE)



