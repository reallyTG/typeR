library(PhySortR)


### Name: convert.eNewick
### Title: Converts Extended Newick Format to Traditional Newick Format
### Aliases: convert.eNewick

### ** Examples

 ### Converts the phylogenetic tree into traditional Newick format. 
 tree <- "((A:0.1,(B:0.3,C:0.2):0.2[60]):0.4[100],(E:0.12,F:0.09):0.4[100]);"
 new.tree <- convert.eNewick(tree)
 new.tree



