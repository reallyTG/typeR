library(BHMSMAfMRI)


### Name: BHMSMA
### Title: Bayesian hierarchical multi-subject multiscale analysis of
###   functional MRI data
### Aliases: BHMSMA

### ** Examples

# Should take less than a minute to run
nsubject <- 3
grid <- 8
ntime <- 4
Data <- array(rnorm(3*8*8*4),dim=c(3,8,8,4))
DesignMatrix <- cbind(c(1,0,1,0), c(1,1,1,1))
analysis <- "multi"
BHMSMA.multi <- BHMSMA(nsubject, grid, Data, DesignMatrix, TrueCoeff=NULL, analysis)



