library(parsetools)


### Name: if-statements
### Title: If Statement Nodes
### Aliases: if-statements pd_is_if pd_get_if_predicate_id
###   pd_get_if_branch_id pd_get_if_alternate_id

### ** Examples

# load example file and get_parse data
ex.file <- system.file("examples", "example.R", package="parsetools")
exprs <- parse(ex.file, keep.source = TRUE)
pd <- get_parse_data(exprs)

# There are 3 expressions so there should be three roots.
sum(pd_is_root(pd$id, pd))
roots <- pd_all_root_ids(pd)

# Find the if statement
is.if <- pd_is_if(pd$id, pd=pd)
sum(is.if)
if.id <- pd$id[is.if]

# The predicate
pd_reconstitute(pd_get_if_predicate_id(if.id, pd), pd)

# The branch for if predicate evaluates TRUE
pd_reconstitute(pd_get_if_branch_id(if.id, pd), pd)

# The alternate for if predicate evaluates FALSE
pd_reconstitute(pd_get_if_alternate_id(if.id, pd), pd)





