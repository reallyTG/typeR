library(optiSel)


### Name: makeA
### Title: Calculates the Pedigree-based Additive Relationship Matrix
### Aliases: makeA

### ** Examples

data(PedigWithErrors)
data(Phen)
Pedig <- prePed(PedigWithErrors)
keep  <- Pedig$Indiv[summary(Pedig)$equiGen>5 & Pedig$Indiv %in% Phen$Indiv]
A     <- makeA(Pedig, keep.only=keep)
A[1:3,1:3]



