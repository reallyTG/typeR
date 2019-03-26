library(parsetools)


### Name: pd_reconstitute
### Title: Reconstitute Expressions
### Aliases: pd_reconstitute

### ** Examples

# load example file and get_parse data
ex.file <- system.file("examples", "example.R", package="parsetools")
exprs <- parse(ex.file, keep.source = TRUE)
pd <- get_parse_data(exprs)

# There are 3 expressions so there should be three roots.
sum(pd_is_root(pd$id, pd))
roots <- pd_all_root_ids(pd)

pd_reconstitute(roots[1], pd)



