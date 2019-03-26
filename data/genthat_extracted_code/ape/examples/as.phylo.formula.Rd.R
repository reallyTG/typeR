library(ape)


### Name: as.phylo.formula
### Title: Conversion from Taxonomy Variables to Phylogenetic Trees
### Aliases: as.phylo.formula
### Keywords: manip

### ** Examples

data(carnivora)
frm <- ~SuperFamily/Family/Genus/Species
tr <- as.phylo(frm, data = carnivora)
plot(tr)
Nnode(tr)
## compare with:
Nnode(as.phylo(frm, data = carnivora, collapse = FALSE))



