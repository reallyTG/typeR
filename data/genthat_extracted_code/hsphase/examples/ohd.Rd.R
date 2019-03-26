library(hsphase)


### Name: ohd
### Title: Opposing Homozygote Detection
### Aliases: ohd
### Keywords: opposing homozygote

### ** Examples

genotype <- matrix(c(        
  2,1,0,                  
  2,0,0,                  
  0,0,2                   
  ), byrow = TRUE, ncol = 3)    
  
ohd(genotype)             



