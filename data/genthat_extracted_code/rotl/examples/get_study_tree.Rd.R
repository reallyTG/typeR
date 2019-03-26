library(rotl)


### Name: get_study_tree
### Title: Study Tree
### Aliases: get_study_tree

### ** Examples

## Not run: 
##D  tree <- get_study_tree(study_id="pg_1144", tree_id="tree2324")
##D 
##D  ## comparison of the first few tip labels depending on the options used
##D  head(get_study_tree(study_id="pg_1144", tree_id="tree2324", tip_label="original_label")$tip.label)
##D  head(get_study_tree(study_id="pg_1144", tree_id="tree2324", tip_label="ott_id")$tip.label)
##D  head(get_study_tree(study_id="pg_1144", tree_id="tree2324", tip_label="ott_taxon_name")$tip.label)
## End(Not run)



