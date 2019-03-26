## ---- eval=TRUE, warning=FALSE, message=FALSE----------------------------
# Load required packages
library(alakazam)
library(igraph)
library(dplyr)

# Select clone from example database
data(ExampleDb)
sub_db <- subset(ExampleDb, CLONE == 3138)

## ---- eval=TRUE----------------------------------------------------------
# This example data set does not have ragged ends
# Preprocess clone without ragged end masking (default)
clone <- makeChangeoClone(sub_db, text_fields=c("SAMPLE", "ISOTYPE"), 
                          num_fields="DUPCOUNT")

# Show combined annotations
clone@data[, c("SAMPLE", "ISOTYPE", "DUPCOUNT")]

## ---- eval=FALSE---------------------------------------------------------
#  # Run PHYLIP and parse output
#  dnapars_exec <- "~/apps/phylip-3.69/dnapars"
#  graph <- buildPhylipLineage(clone, dnapars_exec, rm_temp=TRUE)

## ---- echo=FALSE, warning=FALSE, message=FALSE---------------------------
# Load data insted of running phylip
# Clone 3138 is at index 23
graph <- ExampleTrees[[23]]

## ---- eval=TRUE, warning=FALSE, message=FALSE----------------------------
# The graph has shared annotations for the clone
data.frame(CLONE=graph$clone,
           JUNCTION_LENGTH=graph$junc_len,
           V_GENE=graph$v_gene,
           J_GENE=graph$j_gene)

# The vertices have sequence specific annotations
data.frame(SEQUENCE_ID=V(graph)$name, 
           ISOTYPE=V(graph)$ISOTYPE,
           DUPCOUNT=V(graph)$DUPCOUNT)

## ---- eval=TRUE----------------------------------------------------------
# Plot graph with defaults
plot(graph)

## ---- eval=TRUE----------------------------------------------------------
# Modify graph and plot attributes
V(graph)$color <- "steelblue"
V(graph)$color[V(graph)$name == "Germline"] <- "black"
V(graph)$color[grepl("Inferred", V(graph)$name)] <- "white"
V(graph)$label <- V(graph)$ISOTYPE
E(graph)$label <- ""

# Remove large default margins
par(mar=c(0, 0, 0, 0) + 0.1)
# Plot graph
plot(graph, layout=layout_as_tree, edge.arrow.mode=0, vertex.frame.color="black",
     vertex.label.color="black", vertex.size=40)
# Add legend
legend("topleft", c("Germline", "Inferred", "Sample"), 
       fill=c("black", "white", "steelblue"), cex=0.75)

## ---- eval=TRUE, warning=FALSE, results="hide"---------------------------
# Preprocess clones
clones <- ExampleDb %>%
    group_by(CLONE) %>%
    do(CHANGEO=makeChangeoClone(., text_fields=c("SAMPLE", "ISOTYPE"), 
                                num_fields="DUPCOUNT"))

## ---- eval=FALSE---------------------------------------------------------
#  # Build lineages
#  dnapars_exec <- "~/apps/phylip-3.69/dnapars"
#  graphs <- lapply(clones$CHANGEO, buildPhylipLineage,
#                   dnapars_exec=dnapars_exec, rm_temp=TRUE)

## ---- echo=FALSE, warning=FALSE, message=FALSE---------------------------
# Load data insted of running phylip
graphs <- ExampleTrees

## ---- eval=TRUE----------------------------------------------------------
# Note, clones with only a single sequence will not be processed.
# A warning will be generated and NULL will be returned by buildPhylipLineage
# These entries may be removed for clarity
graphs[sapply(graphs, is.null)] <- NULL

# The set of tree may then be subset by node count for further 
# analysis, if desired.
graphs <- graphs[sapply(graphs, vcount) >= 5]

