library(optiSel)


### Name: pedIBDorM
### Title: Calculates Kinships taking Allele Origin into Account
### Aliases: pedIBDorM

### ** Examples

data(PedigWithErrors)
data(Phen)
keep  <- Phen$Indiv
Pedig <- prePed(PedigWithErrors, keep=keep, thisBreed="Hinterwaelder", lastNative=1970)
Kin   <- pedIBDorM(Pedig, thisBreed="Hinterwaelder", keep.only=keep)

mean(Kin$pedIBDorM)
#[1] 0.8201792
mean(Kin$pedIBDorMM)
#[1] 0.335358



