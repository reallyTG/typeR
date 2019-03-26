library(hsphase)


### Name: ohg
### Title: Matrix of Opposing Homozygotes
### Aliases: ohg
### Keywords: opposing-homozygote snp genoytpe

### ** Examples

genotype <- matrix(c(        
  2,1,0,                  
  2,0,0,                  
  0,0,2                   
  ), byrow = TRUE, ncol = 3)    
  
ohg(genotype)             



