library(optiSel)


### Name: pedIBDatN
### Title: Calculates the Pedigree Based Kinship at Native Alleles
### Aliases: pedIBDatN

### ** Examples

data(PedigWithErrors)
data(Phen)
keep  <- Phen$Indiv
Pedig <- prePed(PedigWithErrors, keep=keep, thisBreed="Hinterwaelder", lastNative=1970)
pKinatN <- pedIBDatN(Pedig, thisBreed="Hinterwaelder", keep.only=keep, nGen=6)

#Number of Migrant Founders: 237
#Number of Native  Founders: 150
#Individuals in Pedigree   : 1658
#Native effective size     : 49.5

## Mean kinship at native segments:
pKinatN$mean
#[1] 0.0776925

## Note that this can not be computed as mean(pKinatN$of).

## Results for individuals:
pKinatN$of <- pKinatN$Q1/pKinatN$Q2
pKinatN$of["276000812497583","276000812496823"]
#[1] 0.05941229





