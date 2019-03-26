library(taxa)


### Name: n_supertaxa_1
### Title: Get number of supertaxa
### Aliases: n_supertaxa_1

### ** Examples

# Test for the presence of supertaxa containing each taxon
n_supertaxa_1(ex_taxmap)

# Filter taxa based on the presence of supertaxa
#  (this command removes all root taxa)
filter_taxa(ex_taxmap, n_supertaxa_1 > 0)




