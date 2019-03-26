library(aphid)


### Name: writePHMM
### Title: Export profile hidden Markov models as text.
### Aliases: writePHMM

### ** Examples

  ## Derive a profile hidden Markov model from the small globin alignment
  data(globins)
  x <- derivePHMM(globins, residues = "AMINO", seqweights = NULL)
  x
  fl <- tempfile()
  writePHMM(x, file = fl)
  readPHMM(fl)
  ##
  ## Derive a PHMM for the woodmouse data and write to file
  ## No test: 
    library(ape)
    data(woodmouse)
    woodmouse.PHMM <- derivePHMM(woodmouse)
    tmpf <- tempfile(fileext = ".hmm")
    writePHMM(woodmouse.PHMM, file = tmpf)
  
## End(No test)



