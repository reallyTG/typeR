library(RRphylo)


### Name: PGLS_fossil
### Title: Phylogenetic Generalized Least Square with fossil phylogenies
### Aliases: PGLS_fossil

### ** Examples

data("DataOrnithodirans")
DataOrnithodirans$treedino->treedino
DataOrnithodirans$massdino->massdino
DataOrnithodirans$statedino->statedino
statedino[match(treedino$tip.label,names(statedino))]->statedino
massdino[match(treedino$tip.label,names(massdino))]->massdino

PGLS_fossil(tree=treedino,x=statedino,y=massdino)




