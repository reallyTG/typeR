library(Familias)


### Name: FamiliasPrior
### Title: Calculates a prior distribution for a list of pedigrees
### Aliases: FamiliasPrior

### ** Examples

require(Familias)
persons <- c("mother", "daughter", "AF")
ped1 <- FamiliasPedigree(id=persons, dadid=c(NA, "AF", NA), momid=c(NA, "mother", NA),
 sex=c("female", "female", "male"))
ped2 <- FamiliasPedigree(id=c(persons, "TF"), dadid=c(NA, "TF", NA, NA), 
momid=c(NA, "mother", NA, NA), 
sex=c("female", "female", "male", "male"))
ped3 <- FamiliasPedigree(id=c(persons, "TF", "gf", "gm"), dadid = c(NA, "TF", "gf", "gf", NA, NA), 
momid=c(NA, "mother", "gm", "gm", NA, NA), 
sex=c("female", "female", "male", "male", "male", "female"))
mypedigrees <- list(isFather = ped1, unrelated=ped2, isUncle = ped3)
FamiliasPrior(mypedigrees)
granddad <- FamiliasPedigree(id=c(persons, "TF", "gm"), dadid=c(NA, "TF", NA, "AF", NA), 
momid=c(NA, "mother", NA, "gm", NA), sex=c("female", "female", "male", "male", "female"))
FamiliasPrior(c(mypedigrees, list(granddad)))
FamiliasPrior(c(mypedigrees, list(granddad)), maxGenerations = 1)



