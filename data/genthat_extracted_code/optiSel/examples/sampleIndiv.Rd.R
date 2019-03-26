library(optiSel)


### Name: sampleIndiv
### Title: Sample Individuals from Pedigree
### Aliases: sampleIndiv

### ** Examples

data("PedigWithErrors")
set.seed(1)
Pedig <- prePed(PedigWithErrors)
use   <- Pedig$Breed=="Hinterwaelder"
keep  <- sampleIndiv(Pedig[use, ], from="Born", each=5)
keep



