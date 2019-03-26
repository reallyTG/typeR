library(fbar)


### Name: recompose_metabolites
### Title: Merge metabolite stub and compartment to form an id
### Aliases: recompose_metabolites

### ** Examples

data(ecoli_core)

mod <- reactiontbl_to_expanded(ecoli_core)

decompose_metabolites(mod$mets)

recompose_metabolites(decompose_metabolites(mod$mets))



