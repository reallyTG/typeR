library(HeritSeq)


### Name: getReadMatrix.CP
### Title: Simulate a read matrix from compound Poisson mixed effect models
###   (CPMM).
### Aliases: getReadMatrix.CP

### ** Examples

## Generate a sequencing dataset with 5 features and 6 strains. 
## Assign parameter values.
rep.num <- c(3, 5, 2, 3, 4, 2)
a0s <- c(-1, 1, 2, 5, 10)
sig2s <- c(10, 0.2, 0.1, 0.03, 0.01)
ps <- rep(1.5, 5)
phis <- c(1.5, 1, 0.5, 0.1, 0.1)

set.seed(1234)
## Generate reads:
cpData <- getReadMatrix.CP(rep.num, a0s, sig2s, ps, phis)
## Generate strain names:
str <- sapply(1:length(rep.num), function(x){
  str.x <- paste0("S", x)
  return(rep(str.x, rep.num[x]))
})
str <- do.call(c, str)



