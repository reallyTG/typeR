library(parsetools)


### Name: family-nodes
### Title: Family-wise Node Identification and Navigation.
### Aliases: family-nodes pd_get_children_ids pd_is_firstborn
###   pd_get_firstborn pd_get_parent_id pd_get_ancestor_ids
###   pd_get_sibling_ids pd_get_next_sibling_id pd_get_prev_sibling_id

### ** Examples

# load example file and get_parse data
ex.file <- system.file("examples", "example.R", package="parsetools")
exprs <- parse(ex.file, keep.source = TRUE)
pd <- get_parse_data(exprs)

# There are 3 expressions so there should be three roots.
sum(pd_is_root(pd$id, pd))
roots <- pd_all_root_ids(pd)

# assignments have three children
# The operator, the assignment, and the value.
kids <- pd_get_children_ids(roots[[1]], pd)
# The token tells what kind of node the ids represent.
pd_token(kids, pd)



