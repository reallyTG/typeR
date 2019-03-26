library(rmonad)


### Name: rmonad_getters
### Title: Vectorized getters for public Rmonad fields
### Aliases: rmonad_getters get_parents get_dependents get_nest get_prior
###   get_depth get_nest_depth get_value get_key get_id get_OK get_code
###   get_tag get_error get_warnings get_notes get_doc get_meta get_time
###   get_mem get_summary

### ** Examples

data(gff)
m <- gff$good_result

# vectorized accessors for all stored slots
get_value(m, warn=FALSE)
get_OK(m)
get_code(m)
get_dependents(m)
get_doc(m)
get_error(m)
get_id(m)
get_mem(m)
get_meta(m)
get_nest(m)
get_nest_depth(m)
get_notes(m)
get_parents(m)
get_prior(m)
get_summary(m)
get_time(m)
get_warnings(m)

# get the code associated with long running functions
get_code(m)[get_time(m) > 0.1]

# Calculate the average node degree
nparents <- sapply(get_parents(m), length)
nchildren <- sapply(get_dependents(m), length)
sum(nparents + nchildren) / size(m) 



