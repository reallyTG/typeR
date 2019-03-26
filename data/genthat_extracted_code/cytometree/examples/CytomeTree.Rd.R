library(cytometree)


### Name: CytomeTree
### Title: Binary tree algorithm for cytometry data analysis.
### Aliases: CytomeTree

### ** Examples

head(DLBCL)

# number of cell event
N <- nrow(DLBCL)

# Cell events
cellevents <- DLBCL[, c("FL1", "FL2", "FL4")]


# Manual partitioning of the set N (from FlowCAP-I)
manual_labels <- DLBCL[, "label"]


# Build the binary tree
Tree <- CytomeTree(cellevents, minleaf = 1, t=.1)


# Retreive the resulting partition of the set N
Tree_Partition <- Tree$labels


# Plot node distributions
par(mfrow=c(1, 2))
plot_nodes(Tree)

# Choose a node to plot
plot_nodes(Tree,"FL4.1")

# Plot a graph of the tree
par(mfrow=c(1,1))
plot_graph(Tree,edge.arrow.size=.3, Vcex =.5, vertex.size = 30)

# Run the annotation algorithm
Annot <- Annotation(Tree,plot=FALSE)
Annot$combinations


# Compare to the annotation gotten from the tree
Tree$annotation


# Example of sought phenotypes
# Variable in which sought phenotypes can be entered in the form of matrices.
phenotypes <- list()

# Sought phenotypes:
## FL2+ FL4-.
phenotypes[[1]] <- rbind(c("FL2", 1), c("FL4", 0))

## FL2- FL4+.
phenotypes[[2]] <- rbind(c("FL2", 0), c("FL4", 1))

## FL2+ FL4+.
phenotypes[[3]] <- rbind(c("FL2", 1), c("FL4", 1))

# Retreive cell populations found using Annotation.
PhenoInfos <- RetrievePops(Annot, phenotypes)
PhenoInfos$phenotypesinfo

# F-measure ignoring cells labeled 0 as in FlowCAP-I.

# Use FmeasureC() in any other case.
FmeasureC_no0(ref=manual_labels, pred=Tree_Partition)



## Not run: 
##D 
##D # Scatterplots.
##D library(ggplot2)
##D 
##D # Ignoring cells labeled 0 as in FlowCAP-I.
##D rm_zeros <- which(!manual_labels)
##D 
##D # Building the data frame to scatter plot the data.
##D FL1 <- cellevents[-c(rm_zeros),"FL1"]
##D FL2 <- cellevents[-c(rm_zeros),"FL2"]
##D FL4 <- cellevents[-c(rm_zeros),"FL4"]
##D n <- length(FL1)
##D Labels <- c(manual_labels[-c(rm_zeros)]%%2+1, Tree_Partition[-c(rm_zeros)])
##D Labels <- as.factor(Labels)
##D method <- as.factor(c(rep("FlowCap-I",n),rep("CytomeTree",n)))
##D 
##D scatter_df <- data.frame("FL2" = FL2, "FL4" = FL4, "labels" = Labels, "method" = method)
##D p <- ggplot2::ggplot(scatter_df,  ggplot2::aes_string(x = "FL2", y = "FL4", colour = "labels")) +
##D  ggplot2::geom_point(alpha = 1,cex = 1) +
##D  ggplot2::scale_colour_manual(values = c("green","red","blue")) +
##D  ggplot2::facet_wrap(~ method) +
##D  ggplot2::theme_bw() +
##D  ggplot2::theme(legend.position="bottom")
##D p
##D 
## End(Not run)



