library(optiSel)


### Name: candes
### Title: Candidate Description
### Aliases: candes

### ** Examples

data(PedigWithErrors)

Pedig      <- prePed(PedigWithErrors, thisBreed="Hinterwaelder", lastNative=1970, 
                   keep=PedigWithErrors$Born%in%1992)
use        <- Pedig$Born %in% (1980:1990) & Pedig$Breed=="Hinterwaelder"
Population <- Pedig$Indiv[use]

Pedig$NC   <- pedBreedComp(Pedig, thisBreed="Hinterwaelder")$native
pKin       <- pedIBD(Pedig, keep.only=Population)
pKinatN    <- pedIBDatN(Pedig, thisBreed="Hinterwaelder",  keep.only=Population)
Phen       <- Pedig[Population, ]

### Example 1: Overlapping Generations
### Old individuals contribute only little to the means:

cont <- agecont(Pedig, Population, maxAge=10)
cand <- candes(phen=Phen, pKin=pKin, pKinatN=pKinatN, cont=cont)

cand$current[,c("Name", "Type", "Breed", "Val", "Var")]
#     Name      Type         Breed         Val     Var
#1      BV     trait Hinterwaelder -0.55979308      BV
#2      NC     trait Hinterwaelder  0.56695077      NC
#3    pKin   kinship Hinterwaelder  0.02230896    pKin
#4 pKinatN nat. kin. Hinterwaelder  0.04678453 pKinatN

# BV:      simulated breeding values
# NC:      native genetic contribution computed from pedigree
# pKin:    pedigree-based kinship
# pKinatN: pedigree-based native kinship


### Example 2: Discrete Generations (cont=NULL). 
### Old individuals and young individuals contribute equally to the means:

Phen$Born <- 1
cand <- candes(phen=Phen, pKin=pKin, pKinatN=pKinatN, cont=NULL)

cand$current[,c("Name", "Type", "Breed", "Val", "Var")]

#     Name      Type         Breed         Val     Var
#1      BV     trait Hinterwaelder -0.71910508      BV
#2      NC     trait Hinterwaelder  0.58226604      NC
#3    pKin   kinship Hinterwaelder  0.01979228    pKin
#4 pKinatN nat. kin. Hinterwaelder  0.04053012 pKinatN


### Shorthand:

cand$mean
#          BV       NC       pKin    pKinatN
#1 -0.7191051 0.582266 0.01979228 0.04053012

cand$mean$pKin
#[1] 0.01979228




