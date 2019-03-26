library(HeritSeq)


### Name: getReadMatrix.NB
### Title: Simulate a count matrix from negative binomial mixed effect
###   models (NBMM).
### Aliases: getReadMatrix.NB

### ** Examples

## Generate a sequencing dataset with 5 features and 6 strains. 
## Assign parameter values.
rep.num <- c(3, 5, 2, 3, 4, 2)
a0s <- c(-1, 1, 2, 5, 10)
sig2s <- c(10, 0.2, 0.1, 0.03, 0.01)
phis <- c(0.5, 1, 0.05, 0.01, 0.1)

set.seed(1234)
## Generate reads:
nbData <- getReadMatrix.NB(rep.num, a0s, sig2s, phis)



