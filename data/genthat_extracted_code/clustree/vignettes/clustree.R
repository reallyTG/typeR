## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----load-iris-----------------------------------------------------------
library(clustree)
data("iris_clusts")

head(iris_clusts)

## ----iris-plot-----------------------------------------------------------
clustree(iris_clusts, prefix = "K")

## ----iris-aes-static-----------------------------------------------------
clustree(iris_clusts, prefix = "K", node_colour = "purple", node_size = 10,
         node_alpha = 0.8)

## ----iris-aes------------------------------------------------------------
clustree(iris_clusts, prefix = "K", node_colour = "Sepal.Width",
         node_colour_aggr = "mean")

## ----iris-layout---------------------------------------------------------
clustree(iris_clusts, prefix = "K", layout = "sugiyama")

## ----iris-layout-nocore--------------------------------------------------
clustree(iris_clusts, prefix = "K", layout = "sugiyama", use_core_edges = FALSE)

## ----iris-labels---------------------------------------------------------
clustree(iris_clusts, prefix = "K", node_label = "Petal.Length",
         node_label_aggr = "max")

## ----iris-labels-custom--------------------------------------------------
label_species <- function(labels) {
    if (length(unique(labels)) == 1) {
        species <- as.character(unique(labels))
    } else {
        species <- "mixed"
    }
    return(species)
}

clustree(iris_clusts, prefix = "K", node_label = "Species",
         node_label_aggr = "label_species")

## ----sc-example----------------------------------------------------------
data("sc_example")
names(sc_example)

## ----sce-present, echo = FALSE-------------------------------------------
sce_present <- requireNamespace("SingleCellExperiment", quietly = TRUE)

## ----sce-not, echo = FALSE, results = 'asis', eval = !sce_present--------
#  cat("> **NOTE:** This section requires the SingleCellExperiment package.",
#      "This package isn't installed so the results won't be shown.")

## ----sce, eval = sce_present---------------------------------------------
suppressPackageStartupMessages(library("SingleCellExperiment"))

sce <- SingleCellExperiment(assays = list(counts = sc_example$counts,
                                          logcounts = sc_example$logcounts),
                            colData = sc_example$sc3_clusters,
                            reducedDims = SimpleList(TSNE = sc_example$tsne))

## ----sce-colData, eval = sce_present-------------------------------------
head(colData(sce))

## ----sce-plot, eval = sce_present----------------------------------------
clustree(sce, prefix = "sc3_", suffix = "_clusters")

## ----seurat-present, echo = FALSE----------------------------------------
seurat_present <- requireNamespace("Seurat", quietly = TRUE)

## ----seurat-not, echo = FALSE, results = 'asis', eval = !seurat_present----
#  cat("> **NOTE:** This section requires the Seurat package.",
#      "This package isn't installed so the results won't be shown.")

## ----seurat, eval = seurat_present---------------------------------------
suppressPackageStartupMessages(library("Seurat"))

seurat <- CreateSeuratObject(sc_example$counts,
                             meta.data = sc_example$seurat_clusters)
seurat <- SetDimReduction(seurat, "TSNE", "cell.embeddings", sc_example$tsne)

## ----seurat-meta, eval = seurat_present----------------------------------
head(seurat@meta.data)

## ----seurat-plot, eval = seurat_present----------------------------------
clustree(seurat)

## ----plot-gene, eval = seurat_present------------------------------------
clustree(seurat, node_colour = "Gene730", node_colour_aggr = "median")

## ----iris-overlay--------------------------------------------------------
clustree_overlay(iris_clusts, prefix = "K", x_value = "PC1", y_value = "PC2")

## ----iris-overlay-colour-------------------------------------------------
clustree_overlay(iris_clusts, prefix = "K", x_value = "PC1", y_value = "PC2",
                 use_colour = "points", alt_colour = "blue")

## ----iris-overlay-labels-------------------------------------------------
clustree_overlay(iris_clusts, prefix = "K", x_value = "PC1", y_value = "PC2",
                 label_nodes = TRUE)

## ----iris-overlay-sides--------------------------------------------------
overlay_list <- clustree_overlay(iris_clusts, prefix = "K", x_value = "PC1",
                                 y_value = "PC2", plot_sides = TRUE)

names(overlay_list)

overlay_list$x_side
overlay_list$y_side

## ----modify--------------------------------------------------------------
clustree(iris_clusts, prefix = "K") +
    scale_color_brewer(palette = "Set1") +
    scale_edge_color_continuous(low = "blue", high = "red")

## ----legends-------------------------------------------------------------
clustree(iris_clusts, prefix = "K") +
    guides(edge_colour = FALSE, edge_alpha = FALSE) +
    theme(legend.position = "bottom")

## ----citation------------------------------------------------------------
citation("clustree")

