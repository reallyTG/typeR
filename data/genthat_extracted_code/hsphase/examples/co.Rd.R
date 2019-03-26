library(hsphase)


### Name: co
### Title: Crossover Detection
### Aliases: co
### Keywords: crossover

### ** Examples

genotype <- matrix(c(           # Define a Half-sib Genotype Matrix
  2,1,0,                        # Individual 1
  2,0,2,                        # Individual 2
  0,0,2                         # Individual 3
  ), byrow = TRUE, ncol = 3)    # There are 3 individuals with three SNPs
  
co(genotype)               




