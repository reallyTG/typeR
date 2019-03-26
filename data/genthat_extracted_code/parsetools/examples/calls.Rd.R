library(parsetools)


### Name: calls
### Title: Call nodes
### Aliases: calls pd_is_call pd_is_symbol_call pd_get_call_symbol_id
###   pd_get_call_arg_ids

### ** Examples

# load example file and get_parse data
ex.file <- system.file("examples", "example.R", package="parsetools")
exprs <- parse(ex.file, keep.source = TRUE)
pd <- get_parse_data(exprs)

# There are 3 expressions so there should be three roots.
sum(pd_is_root(pd$id, pd))
roots <- pd_all_root_ids(pd)

# which root is a call?
pd_is_call(roots, pd)
id <- roots[pd_is_call(roots, pd)]
# not all calls are symbole calls.
pd_is_symbol_call(id, pd)
# what is the symbol being called?
pd_text(pd_get_call_symbol_id(id, pd), pd)
# what are the arguments to the call
args <- pd_get_call_arg_ids(id, pd)
pd_token(pd_get_firstborn(args, pd), pd)
pd_text(pd_get_firstborn(args, pd), pd)



