## ----echo=FALSE----------------------------------------------------------
knitr::opts_chunk$set(dev="svg", fig.width=5, fig.height=5, fig.align="center", dev="svg")
set.seed(0)

## ------------------------------------------------------------------------
library(ontologyIndex)
data(go)

library(ontologySimilarity)
data(gene_GO_terms)
data(GO_IC)

## ------------------------------------------------------------------------
beach <- gene_GO_terms[c("LRBA", "LYST", "NBEA", "NBEAL1", "NBEAL2", "NSMAF", "WDFY3", "WDFY4", "WDR81")]

## ------------------------------------------------------------------------
go$name[beach$LRBA]

## ------------------------------------------------------------------------
cc <- go$id[go$name == "cellular_component"]
beach_cc <- lapply(beach, function(x) intersection_with_descendants(go, roots=cc, x)) 
data.frame(check.names=FALSE, `#terms`=sapply(beach, length), `#CC terms`=sapply(beach_cc, length))

## ------------------------------------------------------------------------
sim_matrix <- get_sim_grid(
	ontology=go, 
	information_content=GO_IC,
	term_sets=beach)

library(paintmap)
paintmap(colour_matrix(sim_matrix))

## ------------------------------------------------------------------------
get_sim_p_from_ontology(
	ontology=go,
	information_content=GO_IC,
	term_sets=gene_GO_terms,
	group=names(beach)
)

