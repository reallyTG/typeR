library(vegan)


### Name: taxondive
### Title: Indices of Taxonomic Diversity and Distinctness
### Aliases: taxondive summary.taxondive plot.taxondive taxa2dist
### Keywords: univar

### ** Examples

## Preliminary: needs better data and some support functions
data(dune)
data(dune.taxon)
# Taxonomic distances from a classification table with variable step lengths.
taxdis <- taxa2dist(dune.taxon, varstep=TRUE)
plot(hclust(taxdis), hang = -1)
# Indices
mod <- taxondive(dune, taxdis)
mod
summary(mod)
plot(mod)



