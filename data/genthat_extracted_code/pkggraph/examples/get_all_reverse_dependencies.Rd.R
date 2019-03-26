library(pkggraph)


### Name: get_all_reverse_dependencies
### Title: get_all_reverse_dependencies
### Aliases: get_all_reverse_dependencies

### ** Examples

pkggraph::init(local = TRUE)
# general use
pkggraph::get_all_reverse_dependencies("mlr")
# specify two levels
pkggraph::get_all_reverse_dependencies("mlr", level = 2)
# specify relation(s)
pkggraph::get_all_reverse_dependencies("mlr", level = 2, relation = "Imports")
# setting strict to TRUE to only consider 'Imports' of the previous level
pkggraph::get_all_reverse_dependencies("mlr"
                                       , level    = 2
                                       , relation = "Imports"
                                       , strict   = TRUE)



