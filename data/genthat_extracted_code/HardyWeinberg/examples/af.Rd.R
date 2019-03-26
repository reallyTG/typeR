library(HardyWeinberg)


### Name: af
### Title: Function to compute allele frequencies
### Aliases: af
### Keywords: misc

### ** Examples

   X <- as.vector(rmultinom(1,100,c(0.5,0.4,0.1)))
   X <- X/sum(X)
   print(X)
   print(af(X))



