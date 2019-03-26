## ----knitrsetup, include=FALSE-------------------------------------------
knitr::opts_chunk$set(tidy = TRUE)
knitr::knit_hooks$set(small.mar = function(before, options, envir) {
    if (before) par(mar = c(0, 0, 0, 0))  # no margin
})

## ---- message=FALSE------------------------------------------------------
library(cytometree)
data(DLBCL)
dim(DLBCL)
head(DLBCL)

## ------------------------------------------------------------------------
# getting the only the cell events with the 3 markers measured:
cellevents <- DLBCL[,c("FL1", "FL2", "FL4")]
# storing the maanual gating reference from FlowCAP-I:
manual_labels <- DLBCL[,"label"]

## ---- message=FALSE, results='hide'--------------------------------------
# Build the binary tree:
Tree <- CytomeTree(cellevents, minleaf = 1, t = 0.1)
# Retreive the resulting partition (i.e. automatic gating):
Tree_Partition <- Tree$labels

## ---- fig.width = 4, fig.height=4, small.mar=TRUE------------------------
# Plot a graph of the tree (with specific graphical parameters):
plot_graph(Tree, edge.arrow.size = 0.3, Vcex = 0.8, vertex.size = 30)

## ---- small.mar=TRUE, fig.width=6.5, fig.height=6------------------------
# Plot the distribution fit for each node:
plot_nodes(Tree)

## ------------------------------------------------------------------------
# Plot the distribution fit for a particular node:
plot_nodes(Tree, "FL4.1")

## ------------------------------------------------------------------------
# Run the annotation algorithm:
Annot <- Annotation(Tree,plot=FALSE)
Annot$combinations

## ------------------------------------------------------------------------
# Annotation gotten from the tree:
Tree$annotation

## ------------------------------------------------------------------------

# seeked cell type: FL2+FL4+
pheno_ex1 <- RetrievePops(Annot, phenotypes = list(rbind(c("FL2", 1), c("FL4", 1))))
pheno_ex1$phenotypesinfo

#One can look for several cell types at once:
phenotypes <- list()
# FL2+FL4-
phenotypes[[1]] <- rbind(c("FL2", 1), c("FL4", 0))
# FL2-FL4+
phenotypes[[2]] <- rbind(c("FL2", 0), c("FL4", 1))
# Retreive corresponding cell populations:
PhenoInfos <- RetrievePops(Annot, phenotypes)
PhenoInfos$phenotypesinfo

## ---- echo=FALSE, small.mar=TRUE, fig.width=6.5, fig.height=4, message=FALSE----
# F-measure ignoring cells labeled 0 as in FlowCAP-I.
# Use FmeasureC() in any other case.
Fmeas <- cytometree::FmeasureC_no0(ref=manual_labels, pred=Tree_Partition)
# Scatterplots.
library(ggplot2)
library(viridis)
# Ignoring cells labeled 0 as in FlowCAP-I.
# Building the data frame to scatter plot the data.
FL1 <- cellevents[, "FL1"]
FL2 <- cellevents[, "FL2"]
FL4 <- cellevents[, "FL4"]
n <- length(FL1)

man_lab <- factor(as.character(manual_labels))
levels(man_lab) <- c("outliers (manual gating)", "pop1", "pop2")

FL4pos <- RetrievePops(Annot, phenotypes = list(cbind("FL4", 1)))
auto_lab <- factor(as.character(FL4pos$Mergedleaves))
levels(auto_lab) <- c("pop2", "pop1")
Labels <- factor(c(as.character(man_lab), as.character(auto_lab)))

method <- as.factor(c(rep("FlowCap-I manual gating", n), rep("CytomeTree auto gating", n)))
scatter_df <- data.frame("FL2" = FL2, "FL4" = FL4, "Label" = Labels, "method" = method)

p <- ggplot2::ggplot(scatter_df,  ggplot2::aes_string(x = "FL2", y="FL4",colour="Label"))+
 ggplot2::geom_point(alpha = 1,cex = 1)+ 
 ggplot2::scale_colour_manual(values = c("grey", viridis::viridis(4))) +
 ggplot2::facet_wrap(~ method) +
 ggplot2::theme_bw() +
 ggplot2::theme(legend.position="bottom") +
 ggplot2::guides(colour = ggplot2::guide_legend(override.aes = list(size=3)))+
 ggplot2::ggtitle(paste("F-measure (manual gating as reference - removing the outliers) =", round(Fmeas, 3)))
p

## ---- message=FALSE------------------------------------------------------
data(HIPC)
dim(HIPC)
head(HIPC)

## ------------------------------------------------------------------------
# getting the only the cell events with the 3 markers measured:
cellevents <- HIPC[,c("CCR7", "CD4", "CD45RA", "HLADR" ,"CD38" ,"CD8")]
# storing the maanual gating reference from FlowCAP-I:
manual_labels <- HIPC[,"label"]

## ---- message=FALSE, results='hide'--------------------------------------
# Build the binary tree:
Tree <- CytomeTree(cellevents, minleaf = 1, t = 0.2)
# Retreive the resulting partition (i.e. automatic gating):
Tree_Partition <- Tree$labels

## ---- fig.width = 6.2, fig.height = 6.2, small.mar = TRUE----------------
# Plot a graph of the tree (with specific graphical parameters):
plot_graph(Tree, edge.arrow.size = 0.4, Vcex = 0.45)

## ---- echo=FALSE, small.mar=TRUE, fig.width=6.5, fig.height=4, message=FALSE----
# Plot the fit for 2 specific nodes:
plot_nodes(Tree, list("CD4.1", "CD45RA.7"))

## ------------------------------------------------------------------------
# Run the annotation algorithm:
Annot <- Annotation(Tree,plot=FALSE)
Annot$combinations

## ---- fig.width=5, fig.height=5------------------------------------------
#One can look for several cell types at once:
phenotypes <- list()
# CD8-CD4+CCR7-CD45RA+
CD4effector <-  rbind(c("CD8", 0), 
                      c("CD4", 1), 
                      c("CCR7", 0), 
                      c("CD45RA", 1))
phenotypes[[1]] <- CD4effector

# CD8-CD4+CCR7+CD45RA+
CD4naive <-     rbind(c("CD8", 0), 
                      c("CD4", 1), 
                      c("CCR7", 1), 
                      c("CD45RA", 1))
phenotypes[[2]] <- CD4naive

# CD8-CD4+CCR7+CD45RA-
CD4CM <-        rbind(c("CD8", 0), 
                      c("CD4", 1), 
                      c("CCR7", 1), 
                      c("CD45RA", 0))
phenotypes[[3]] <- CD4CM

# CD8-CD4+CCR7+CD45RA+
CD4effectorM <- rbind(c("CD8", 0), 
                      c("CD4", 1), 
                      c("CCR7", 0), 
                      c("CD45RA", 0))
phenotypes[[4]] <- CD4effectorM

# Retreive corresponding cell populations:
PhenoInfos <- RetrievePops(Annot, phenotypes)
# One can find informations about the seeked phenotypes in 
PhenoInfos$phenotypesinfo
# According to PhenoInfos$phenotypesinfo, CD8-CD4+CCR7-CD45RA+ population is labeled 12
# According to PhenoInfos$phenotypesinfo, CD8-CD4+CCR7+CD45RA+ population is labeled 5
# According to PhenoInfos$phenotypesinfo, CD8-CD4+CCR7+CD45RA- population is labeled 4
# According to PhenoInfos$phenotypesinfo, CD8-CD4+CCR7+CD45RA+ population is comprised
# of 4 clusters labeled 8,9,10, 11. They were merged into a new cluster labeled 13.

# The new partition, with merged clusters is to be found in PhenoInfos$Mergedleaves.
auto_labels_merged <- PhenoInfos$Mergedleaves

# Get the indices of the subpopulation comprised of classes labeled 12, 5, 4,13.
subpopulation_indices <- auto_labels_merged %in% c(12, 5, 4, 13)

# Scatter plot the data.
CD45RA <- cellevents[subpopulation_indices, "CD45RA"]
CCR7 <- cellevents[subpopulation_indices, "CCR7"]
auto_lab <- factor(auto_labels_merged[subpopulation_indices])
levels(auto_lab) <- viridis::viridis(length(levels(auto_lab)))
auto_lab <- as.character(auto_lab)
plot(CD45RA, CCR7, col = auto_lab, main = "Automatic gating")

## ---- message=FALSE, results='hide'--------------------------------------
# Build the binary tree, forcing the first node to be CD4, and the second ones HLADR
Tree <- CytomeTree(cellevents, minleaf = 1, t = 0.2, force_first_markers = c("CD4", "HLADR"))

## ---- fig.width = 6.2, fig.height = 6.2, small.mar = TRUE----------------
# Plot a graph of the tree (with specific graphical parameters):
plot_graph(Tree, edge.arrow.size = 0.4, Vcex = 0.45)

