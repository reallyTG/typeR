library(HardyWeinberg)


### Name: maf
### Title: Function to compute minor allele frequencies
### Aliases: maf
### Keywords: misc

### ** Examples

   X <- as.vector(rmultinom(1,100,c(0.5,0.4,0.1)))
   X <- X/sum(X)
   print(X)
   print(maf(X))



