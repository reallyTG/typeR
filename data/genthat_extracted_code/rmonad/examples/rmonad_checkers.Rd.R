library(rmonad)


### Name: rmonad_checkers
### Title: Vectorized existence checkers for public Rmonad fields
### Aliases: rmonad_checkers has_code has_tag has_error has_doc
###   has_warnings has_notes has_meta has_time has_mem has_value
###   has_parents has_dependents has_prior has_nest has_summary

### ** Examples

data(gff)
m <- gff$good_result

has_code(m)
has_dependents(m)
has_doc(m)
has_error(m)
has_mem(m)
has_meta(m)
has_nest(m)
has_notes(m)
has_parents(m)
has_prior(m)
has_summary(m)
has_time(m)
has_value(m)
has_warnings(m)

# find root nodes
which(!has_parents(m))

# find terminal (output) nodes
which(!has_dependents(m))

# count number of independent chains
sum(has_prior(m)) + 1



