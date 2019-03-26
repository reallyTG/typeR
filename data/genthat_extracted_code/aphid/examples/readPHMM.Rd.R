library(aphid)


### Name: readPHMM
### Title: Import profile hidden Markov models into R.
### Aliases: readPHMM

### ** Examples

  ## Derive a profile hidden Markov model from the small globin alignment
  data(globins)
  x <- derivePHMM(globins, residues = "AMINO", seqweights = NULL)
  fl <- tempfile()
  writePHMM(x, file = fl)
  readPHMM(fl)



