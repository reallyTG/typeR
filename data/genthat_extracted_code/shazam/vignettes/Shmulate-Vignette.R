## ---- eval=TRUE, warning=FALSE, message=FALSE----------------------------
library(shazam)

# Input sequence
sequence <- "NGATCTGACGACACGGCCGTGTATTACTGTGCGAGAGATA.TTTA"

# Simulate introduction of 6 mutations using the default HH_S5F targeting model
shmulateSeq(sequence, numMutations=6)

# Simulate introduction of 4 mutations using the MK_RS5NF targeting model
shmulateSeq(sequence, numMutations=4, targetingModel=MK_RS5NF)

## ---- eval=TRUE, warning=FALSE, message=FALSE----------------------------
library(alakazam)
library(shazam)
library(igraph)

# Load example lineage
data(ExampleTrees, package="alakazam")
graph <- ExampleTrees[[17]]

# Input sequence to be used as MRCA of the lineage tree
sequence <- "NGATCTGACGACACGGCCGTGTATTACTGTGCGAGAGATAGTTTA"

# Simulate using the default HH_S5F targeting model
shmulateTree(sequence, graph)

## ---- eval=TRUE, warning=FALSE-------------------------------------------
# The annotation field called "SAMPLE"
vertex_attr(graph)$SAMPLE

# notice that node "GN5SHBT01AKANC" is an offspring of "Inferred1"
par(mar=c(0, 0, 0, 0) + 0.1)
plot(graph, layout=layout_as_tree, edge.arrow.mode=0, vertex.label.cex=0.75)

# Exclude nodes without a sample identifier
# The nodes "Germline" and "Inferred1" are thus excluded
# As a corollary, "GN5SHBT01AKANC", the offspring of "Inferred1", is also excluded
# In this case, "GN5SHBT07JDYW5" is then taken to be the MRCA
shmulateTree(sequence, graph, field="SAMPLE", exclude=NA)

## ---- eval=TRUE, warning=FALSE-------------------------------------------
# The "Inferred1" node is taken to be the MRCA and has 2 immediate offsprings
par(mar=c(0, 0, 0, 0) + 0.1)
plot(graph, layout=layout_as_tree, edge.arrow.mode=0, vertex.label.cex=0.75)

# Add 20% mutation rate to the immediate offsprings of the MRCA
shmulateTree(sequence, graph, junctionWeight=0.2)

