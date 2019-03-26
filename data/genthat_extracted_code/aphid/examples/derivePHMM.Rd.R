library(aphid)


### Name: derivePHMM
### Title: Derive a profile hidden Markov model from sequences.
### Aliases: derivePHMM derivePHMM.DNAbin derivePHMM.AAbin derivePHMM.list
###   derivePHMM.default

### ** Examples

## Small globin alignment data from Durbin et al (1998) Figure 5.3
data(globins)
## derive a profile hidden Markov model from the alignment
globins.PHMM <- derivePHMM(globins, residues = "AMINO", seqweights = NULL)
plot(globins.PHMM, main = "Profile HMM for small globin alignment")
##
## derive a profle HMM from the woodmouse dataset in the
## ape package and plot the first 5 modules
library(ape)
data(woodmouse)
woodmouse.PHMM <- derivePHMM(woodmouse)
plot(woodmouse.PHMM, from = 0, to = 5, main = "Partial woodmouse profile HMM")



