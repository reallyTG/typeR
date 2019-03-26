## ------------------------------------------------------------------------

library(CINNA)


## ----warning=FALSE,message=FALSE-----------------------------------------

data("zachary")
zachary


## ----warning=FALSE,message=FALSE-----------------------------------------

graph_extract_components(zachary)


## ------------------------------------------------------------------------

data("drugTarget")

drug_comp <- graph_extract_components( drugTarget, directed = TRUE, bipartite_proj = TRUE, num_proj = 1)
head(drug_comp)


## ----warning=FALSE,message=FALSE-----------------------------------------
library(igraph)
zachary_edgelist <- as_edgelist(zachary)

misc_extract_components(zachary_edgelist)


## ----warning=FALSE,message=FALSE-----------------------------------------

giant_component_extract(zachary)


## ----warning=FALSE,message=FALSE-----------------------------------------

proper_centralities(zachary)


## ----warning=FALSE, message=FALSE----------------------------------------

calculate_centralities(zachary, include = "Degree Centrality")


## ----warning=FALSE,message=FALSE-----------------------------------------

pr_cent <- proper_centralities(zachary)

calc_cent <- calculate_centralities(zachary, include  = pr_cent[1:10])


## ----fig.width=7, fig.height=6,message=FALSE, fig.cap = "A display of most informative centrality measures based on principal component analysis. The red line indicates the random threshold of contribution. This barplot represents contribution of variable values based on the number of dimensions."----

pca_centralities( calc_cent )


## ----fig.width=7, fig.height=6,message=FALSE, fig.cap = "A representation of most informative centrality measures based on principal component analysis between unscaled(not normalized) centrality values."----

pca_centralities( calc_cent , scale.unit = FALSE )


## ----fig.width=7, fig.height=6,message=FALSE, fig.cap = "A display of most informative centrality measures based on t-Distributed Stochastic Neighbor Embedding analysis among scaled(not normalized) centrality values."----

tsne_centralities( calc_cent, dims = 2, perplexity = 1, scale=TRUE)


## ----fig.width=7, fig.height=6,message=FALSE, fig.cap = " Graph illustration based on centrality measure. The size of nodes represent the degree centrality values."----

visualize_graph( zachary , centrality.type="Degree Centrality")


## ----fig.width=7, fig.height=6,message=FALSE, fig.cap = "Observed centrality measure heatmap. The colors from blue to red displays scaled centrality values."----

visualize_heatmap( calc_cent , scale = TRUE  )


## ----fig.width=7, fig.height=6,message=FALSE, fig.cap = "A display of correlation among computed centrality measures.  The red to blue highlighted circles represent the top to bottom Pearson correlation coefficients[@Benesty2009] which differ from -1 to 1. The higher the value becomes larger, circles' sizes get larger too."----

visualize_correlations(calc_cent,"pearson")


## ----fig.width=7, fig.height=6,message=FALSE, fig.cap = "Circular dendrogram plot of vertices based on specified centrality measure. Each color represents a cluster."----

visualize_dendrogram(zachary, k=4)


## ----fig.width=7, fig.height=6, warning=FALSE, message=FALSE, fig.cap = "Association plot between two centrality variables. The red line is an indicator of linear regression line among them."----

subgraph_cent <- calc_cent[[1]]
Topological_coef <- calc_cent[[2]]

visualize_association(  subgraph_cent , Topological_coef)


## ----fig.width=7, fig.height=6,message=FALSE, fig.cap = "Pairwise Pearson correlation between two centrality values."----

visualize_pair_correlation( subgraph_cent , Topological_coef)


