library(pkggraph)


### Name: neighborhood_graph
### Title: neighborhood_graph
### Aliases: neighborhood_graph

### ** Examples

# explore first level dependencies
pkggraph::init(local = TRUE)
pkggraph::neighborhood_graph("caret")

# explore second level dependencies of class network
pkggraph::neighborhood_graph("caret", level = 2, type = "network")

# get 'imports' specific neighborhood of 'mlr' package with strict = TRUE
neighborhood_graph("mlr"
                   , level        = 2
                   , strict       = TRUE
                   , interconnect = FALSE
                   , relation     = "Imports")

# get 'imports' specific neighborhood of 'mlr' package with strict = FALSE
neighborhood_graph("mlr"
                   , level        = 2
                   , strict       = FALSE
                   , interconnect = FALSE
                   , relation     = "Imports")



