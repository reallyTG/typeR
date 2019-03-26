library(vegan)


### Name: treedive
### Title: Functional Diversity and Community Distances from Species Trees
### Aliases: treedive treeheight treedist
### Keywords: univar

### ** Examples


## There is no data set on species properties yet, and we demonstrate
## the methods using phylogenetic trees
data(dune)
data(dune.phylodis)
cl <- hclust(dune.phylodis)
treedive(dune, cl)
## Significance test using Null model communities.
## The current choice fixes numbers of species and picks species
## proportionally to their overall frequency
oecosimu(dune, treedive, "r1", tree = cl, verbose = FALSE)
## Phylogenetically ordered community table
dtree <- treedist(dune, cl)
tabasco(dune, hclust(dtree), cl)
## Use tree distances  in capscale
capscale(dtree ~ 1, comm=dune)



