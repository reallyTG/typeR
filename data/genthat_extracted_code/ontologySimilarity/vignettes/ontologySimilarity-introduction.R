## ------------------------------------------------------------------------
library(ontologyIndex)
library(ontologySimilarity)
data(hpo)
set.seed(1)

## ------------------------------------------------------------------------
information_content <- descendants_IC(hpo)

## ------------------------------------------------------------------------
term_sets <- replicate(simplify=FALSE, n=5, expr=minimal_set(hpo, sample(hpo$id, size=8)))
term_sets

## ------------------------------------------------------------------------
sim_mat <- get_sim_grid(ontology=hpo, term_sets=term_sets)
sim_mat

## ------------------------------------------------------------------------
get_sim(sim_mat, group=1:3)

## ------------------------------------------------------------------------
get_sim_p(sim_mat, group=1:3)

