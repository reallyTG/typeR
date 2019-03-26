library(pkggraph)


### Name: get_neighborhood
### Title: get_neighborhood
### Aliases: get_neighborhood

### ** Examples

# explore first level dependencies
pkggraph::init(local = TRUE)
pkggraph::get_neighborhood("caret")

# explore second level dependencies
pkggraph::get_neighborhood("caret", level = 2)

# explore second level dependencies without
# considering dependencies from third level
pkggraph::get_neighborhood("caret", level = 2, interconnect = FALSE)

# explore first level dependencies of multiple packages
# and consider second level dependencies
get_neighborhood(c("caret", "mlr"))

# get 'imports' specific neighborhood of 'mlr' package with strict = TRUE
get_neighborhood("mlr"
                 , level        = 2
                 , strict       = TRUE
                 , interconnect = FALSE
                 , relation     = "Imports")

# get 'imports' specific neighborhood of 'mlr' package with strict = FALSE
get_neighborhood("mlr"
                 , level        = 2
                 , strict       = FALSE
                 , interconnect = FALSE
                 , relation     = "Imports")



