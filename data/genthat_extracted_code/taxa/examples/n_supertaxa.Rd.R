library(taxa)


### Name: n_supertaxa
### Title: Get number of supertaxa
### Aliases: n_supertaxa

### ** Examples

# Count number of supertaxa that contain each taxon
n_supertaxa(ex_taxmap)

# Filter taxa based on the number of supertaxa
#  (this command removes all root taxa)
filter_taxa(ex_taxmap, n_supertaxa > 0)




