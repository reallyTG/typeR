library(fbar)


### Name: decompose_metabolites
### Title: Decompose a metabolite table into the metabolite stub itself and
###   the compartment it is in
### Aliases: decompose_metabolites

### ** Examples

data(ecoli_core)

mod <- reactiontbl_to_expanded(ecoli_core)

decompose_metabolites(mod$mets)

recompose_metabolites(decompose_metabolites(mod$mets))



