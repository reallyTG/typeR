library(fam2r)


### Name: PE
### Title: Exclusion probabilities
### Aliases: PE

### ** Examples

data(F21)
pedigrees = F21$pedigrees
datamatrix = F21$datamatrix
loci = F21$loci
available = "Missing Person"
PE(pedigrees, datamatrix, loci, claim = 1, true = 2, 
  available = available, file = NULL)



