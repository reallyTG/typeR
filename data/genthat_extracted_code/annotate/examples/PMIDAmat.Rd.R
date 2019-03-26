library(annotate)


### Name: PMIDAmat
### Title: A function to compute the probe to PubMed id incidence matrix.
### Aliases: PMIDAmat
### Keywords: manip

### ** Examples

  library("hgu95av2.db")
  probe <- names(as.list(hgu95av2ACCNUM))
  Amat <- PMIDAmat("hgu95av2", gene=sample(probe, 10))



