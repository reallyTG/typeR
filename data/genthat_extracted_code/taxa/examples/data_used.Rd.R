library(taxa)


### Name: data_used
### Title: Get values of data used in expressions
### Aliases: data_used
### Keywords: internal

### ** Examples

# Get values for variables names used in expressions
ex_taxmap$data_used(n_legs + dangerous == invalid_expression)
ex_taxmap$data_used(length(unique(taxon_names)))




