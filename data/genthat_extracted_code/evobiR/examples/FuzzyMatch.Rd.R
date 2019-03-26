library(evobiR)


### Name: FuzzyMatch
### Title: Find Close Matches in a tree and dataset
### Aliases: FuzzyMatch
### Keywords: phylogenetics comparative methods

### ** Examples

data(hym.tree)
names <- c("Pepsis_elegans", "Plagiolepis_alluaudi", "Pheidele_lucreti",
           "Meliturgula_scriptifronsi", "Andrena_afimbriat")
FuzzyMatch(tree = hym.tree, data = names, max.dist=3)



