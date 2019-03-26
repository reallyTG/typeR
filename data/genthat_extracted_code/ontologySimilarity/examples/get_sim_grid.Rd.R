library(ontologySimilarity)


### Name: get_sim_grid
### Title: Get similarity matrix of pairwise similarities of term sets.
### Aliases: get_sim_grid

### ** Examples

library(ontologyIndex)
data(hpo)
get_sim_grid(ontology=hpo, term_sets=list(
  `case 1`=c("HP:0001873","HP:0011877"),
  `case 2`=c("HP:0001892","HP:0001873"),
  `case 3`=c("HP:0001872","HP:0000707")))



