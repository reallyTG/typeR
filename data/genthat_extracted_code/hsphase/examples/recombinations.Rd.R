library(hsphase)


### Name: recombinations
### Title: Recombination Number
### Aliases: recombinations
### Keywords: recombination pedigree error block

### ** Examples

genotype <- matrix(c(          
  2,1,0,0,                    
  2,0,2,2,                    
  0,0,2,2,
  0,2,0,0                     
  ), byrow = TRUE, ncol = 4)      
  
recombinations(bmh(genotype))             



