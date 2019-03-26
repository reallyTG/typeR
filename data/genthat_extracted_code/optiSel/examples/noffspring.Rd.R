library(optiSel)


### Name: noffspring
### Title: Calculates Optimum Numbers of Offspring
### Aliases: noffspring

### ** Examples

set.seed(1)
data(PedigWithErrors)

Pedig      <- prePed(PedigWithErrors, thisBreed="Hinterwaelder")
use        <- Pedig$Born %in% (1998:2008) & Pedig$Breed=="Hinterwaelder"
Population <- sampleIndiv(Pedig[use, ], each=50)
pKin       <- pedIBD(Pedig, keep.only=Population)
Phen       <- Pedig[Population, ]
Phen$isCandidate <- Phen$Born %in% (2003:2008)

cont       <- agecont(Pedig, Population)
cand       <- candes(phen=Phen, fA=pedIBD(Pedig, keep.only=Phen$Indiv), cont=cont)
con        <- list(ub.fA=0.0175, uniform="female")
Offspring  <- opticont("max.BV", cand, con, trace = FALSE)

N <- 250
Candidate <- Offspring$parent
Candidate$nOff <- noffspring(Candidate, N)$nOff

sum(Candidate$nOff[Candidate$Sex=="male"])
#[1] 250

sum(Candidate$nOff[Candidate$Sex=="female"])
#[1] 250

round(2*N*Candidate$oc-Candidate$nOff, 2)



