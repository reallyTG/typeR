library(taxa)


### Name: all_names
### Title: Return names of data in 'taxonomy()' or 'taxmap()'
### Aliases: all_names

### ** Examples

# Get the names of all data accesible by non-standard evaluation
all_names(ex_taxmap)

# Dont include the names of automatically included functions.
all_names(ex_taxmap, builtin_funcs = FALSE)




