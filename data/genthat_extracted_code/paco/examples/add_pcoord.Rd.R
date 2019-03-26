library(paco)


### Name: add_pcoord
### Title: Principal Coordinates analysis of phylogenetic distance matrices
### Aliases: add_pcoord

### ** Examples

data(gopherlice)
library(ape)
gdist <- cophenetic(gophertree)
ldist <- cophenetic(licetree)
D <- prepare_paco_data(gdist, ldist, gl_links)
D <- add_pcoord(D)



