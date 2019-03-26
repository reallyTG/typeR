library(HRW)


### Name: protein
### Title: Protein intake dietery study
### Aliases: protein

### ** Examples

library(HRW) ; data(protein)
if (require("lattice"))
   print(xyplot(proteinBioM ~ BMI|factor(female),groups = idnum,
                data = protein, type = "b"))



