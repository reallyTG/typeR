library(optiSel)


### Name: pedIBD
### Title: Calculates the Pedigree-based Kinship Matrix
### Aliases: pedIBD

### ** Examples

data(PedigWithErrors)
data(Phen)
keep  <- Phen$Indiv
Pedig <- prePed(PedigWithErrors, keep=keep, thisBreed="Hinterwaelder", lastNative=1970)
pedA  <- pedIBD(Pedig, keep.only=keep)



