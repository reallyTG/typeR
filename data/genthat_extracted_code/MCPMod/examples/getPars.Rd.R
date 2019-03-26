library(MCPMod)


### Name: getPars
### Title: Calculate location and scale parameters
### Aliases: getPars
### Keywords: models design

### ** Examples

doses <- c(0, 10, 25, 50, 100, 150)                                        
getPars("emax", doses, 25, 0, 0.4)                                         
getPars("logistic", doses, c(50, 10.88111), 0, 0.4) # compare JBS 16, p.650
getPars("betaMod", doses, initEstim = c(0.33, 2.31), base = 0,             
        maxEff = 0.4)                                                      
#example for user model                                                    
userMod <- function(dose, e0, eMax, ed50, h){                             
  e0 + eMax * ( dose^h / (ed50^h + dose^h) )                               
}                                                                          
# function to return location and scale parameters                         
userModPar <- function(dose, initEstim, base, maxEff){                    
  # function to get linear parameters                                      
  # ed50 parameter assumed to be first in initEstim                        
  ed50 <- initEstim[1]                                                     
  h <- initEstim[2]                                                        
  dmax <- max(dose)                                                        
  emax <- maxEff*(ed50^h+dmax^h)/dmax^h                                    
  c(base, emax, initEstim)                                                 
}                                                                          
getPars("userMod", doses, initEstim = c(50,2), base = 0, maxEff = 1) 



