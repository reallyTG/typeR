library(treebase)


### Name: search_treebase
### Title: A function to pull in the phyologeny/phylogenies matching a
###   search query
### Aliases: search_treebase
### Keywords: utility

### ** Examples

## Not run: 
##D ## defaults to return phylogeny
##D Huelsenbeck <- search_treebase("Huelsenbeck", by="author")
##D 
##D ## can ask for character matrices:
##D wingless <- search_treebase("2907", by="id.matrix", returns="matrix")
##D 
##D ## Some nexus matrices don't meet read.nexus.data's strict requirements,
##D ## these aren't returned
##D H_matrices <- search_treebase("Huelsenbeck", by="author", returns="matrix")
##D 
##D ## Use Booleans in search: and, or, not
##D ## Note that by must identify each entry type if a Boolean is given
##D HR_trees <- search_treebase("Ronquist or Hulesenbeck", by=c("author", "author"))
##D 
##D ## We'll often use max_trees in the example so that they run quickly,
##D ## notice the quotes for species.
##D dolphins <- search_treebase('"Delphinus"', by="taxon", max_trees=5)
##D ## can do exact matches
##D humans <- search_treebase('"Homo sapiens"', by="taxon", exact_match=TRUE, max_trees=10)
##D ## all trees with 5 taxa
##D five <- search_treebase(5, by="ntax", max_trees = 10)
##D ## These are different, a tree id isn't a Study id.  we report both
##D studies <- search_treebase("2377", by="id.study")
##D tree <- search_treebase("2377", by="id.tree")
##D c("TreeID" = tree$Tr.id, "StudyID" = tree$S.id)
##D ## Only results with branch lengths
##D ## Has to grab all the trees first, then toss out ones without branch_lengths
##D Near <- search_treebase("Near", "author", branch_lengths=TRUE)
##D  
## End(Not run)



