## ---- eval=TRUE, warning=FALSE, message=FALSE----------------------------
# Load required packages
library(alakazam)
library(igraph)
library(dplyr)

# Load example trees
data(ExampleTrees)

# Select one tree for example purposes
graph <- ExampleTrees[[24]]
# And add some annotation complexity to the tree
V(graph)$SAMPLE[c(2, 7)] <- "-1h"
V(graph)$ISOTYPE[c(2, 7)] <- "IgM"

# Make a list of example trees excluding multi-isotype trees
graph_list <- ExampleTrees[sapply(ExampleTrees, function(x) !any(grepl(",", V(x)$ISOTYPE)))]

## ---- eval=TRUE----------------------------------------------------------
# Set node colors
V(graph)$color[V(graph)$SAMPLE == "-1h"] <- "seagreen"
V(graph)$color[V(graph)$SAMPLE == "+7d"] <- "steelblue"
V(graph)$color[V(graph)$name == "Germline"] <- "black"
V(graph)$color[grepl("Inferred", V(graph)$name)] <- "white"

# Set node labels
V(graph)$label <- paste(V(graph)$SAMPLE, V(graph)$ISOTYPE, sep=", ")
V(graph)$label[V(graph)$name == "Germline"] <- ""
V(graph)$label[grepl("Inferred", V(graph)$name)] <- ""

# Set node shapes
V(graph)$shape <- "crectangle"
V(graph)$shape[V(graph)$name == "Germline"] <- "circle"
V(graph)$shape[grepl("Inferred", V(graph)$name)] <- "circle"

# Set node sizes
V(graph)$size <- 60
V(graph)$size[V(graph)$name == "Germline"] <- 30
V(graph)$size[grepl("Inferred", V(graph)$name)] <- 15 

# Remove large default margins
par(mar=c(0, 0, 0, 0) + 0.05)

# Plot the example tree
plot(graph, layout=layout_as_tree, vertex.frame.color="grey", 
     vertex.label.color="black", edge.label.color="black", 
     edge.arrow.mode=0)

# Add legend
legend("topleft", c("Germline", "Inferred", "-1h", "+7d"), 
       fill=c("black", "white", "seagreen", "steelblue"), cex=0.75)

## ---- eval=TRUE----------------------------------------------------------
# Consider all nodes
getPathLengths(graph, root="Germline")

## ---- eval=TRUE----------------------------------------------------------
# Exclude nodes without an isotype annotation from step count
getPathLengths(graph, root="Germline", field="ISOTYPE", exclude=NA)

## ---- eval=TRUE----------------------------------------------------------
# Summarize tree
df <- summarizeSubtrees(graph, fields=c("SAMPLE", "ISOTYPE"), root="Germline")
print(df[1:4])
print(df[c(1, 5:8)])
print(df[c(1, 9:12)])

## ---- eval=TRUE----------------------------------------------------------
# Set sample colors
sample_colors <- c("-1h"="seagreen", "+7d"="steelblue")

# Box plots of node outdegree by sample
p1 <- plotSubtrees(graph_list, "SAMPLE", "outdegree", colors=sample_colors, 
                   main_title="Node outdegree", legend_title="Time", 
                   style="box", silent=TRUE)
# Box plots of subtree size by sample
p2 <- plotSubtrees(graph_list, "SAMPLE", "size", colors=sample_colors, 
                   main_title="Subtree size", legend_title="Time", 
                   style="box", silent=TRUE)
# Violin plots of subtree path length by isotype
p3 <- plotSubtrees(graph_list, "ISOTYPE", "pathlength", colors=IG_COLORS, 
                   main_title="Subtree path length", legend_title="Isotype", 
                   style="violin", silent=TRUE)
# Violin plots of subtree depth by isotype
p4 <- plotSubtrees(graph_list,  "ISOTYPE", "depth", colors=IG_COLORS, 
                   main_title="Subtree depth", legend_title="Isotype", 
                   style="violin", silent=TRUE)

# Plot in a 2x2 grid
gridPlot(p1, p2, p3, p4, ncol=2)

## ---- eval=TRUE----------------------------------------------------------
# Count direct edges between isotypes
tableEdges(graph, "ISOTYPE")

## ---- eval=TRUE----------------------------------------------------------
# Direct edges excluding germline and inferred nodes
tableEdges(graph, "ISOTYPE", exclude=c("Germline", NA))

## ---- eval=TRUE----------------------------------------------------------
# Count indirect edges walking through germline and inferred nodes
tableEdges(graph, "ISOTYPE", indirect=TRUE, exclude=c("Germline", NA))

## ---- eval=TRUE----------------------------------------------------------
# Test isotype relationships
edge_test <- testEdges(graph_list, "ISOTYPE", nperm=20)

# Print p-value table
print(edge_test)

# Plot null distributions for each annotation pair
plotEdgeTest(edge_test, color="steelblue", main_title="Isotype Edges", 
             style="hist")

## ---- eval=TRUE----------------------------------------------------------
# Use unweighted path length and do not exclude any nodes
mrca_df <- getMRCA(graph, path="steps", root="Germline")

# Print subset of the annotation data.frame
print(mrca_df[c("NAME", "SAMPLE", "ISOTYPE", "STEPS", "DISTANCE")])

## ---- eval=TRUE----------------------------------------------------------
# Exclude nodes without an isotype annotation and use weighted path length
mrca_df <- getMRCA(graph, path="distance", root="Germline", 
                   field="ISOTYPE", exclude=NA)

# Print excluding sequence, label, color, shape and size annotations
print(mrca_df[c("NAME", "SAMPLE", "ISOTYPE", "STEPS", "DISTANCE")])

## ---- eval=TRUE----------------------------------------------------------
# Test isotype MRCA annotations
mrca_test <- testMRCA(graph_list, "ISOTYPE", nperm=20)

# Print p-value table
print(mrca_test)

# Plot null distributions for each annotation
plotMRCATest(mrca_test, color="steelblue", main_title="Isotype MRCA", 
             style="hist")

