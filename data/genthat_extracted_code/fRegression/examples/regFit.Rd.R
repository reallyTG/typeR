library(fRegression)


### Name: regFit
### Title: Regression Modelling
### Aliases: regFit gregFit
### Keywords: models

### ** Examples

## regSim -
   x <- regSim(model = "LM3", n = 100)
  
   # LM       
   regFit(Y ~ X1 + X2 + X3, data = x, use = "lm") 
   
   # RLM      
   regFit(Y ~ X1 + X2 + X3, data = x, use = "rlm") 
   # AM       
   regFit(Y ~ X1 + X2 + X3, data = x, use = "gam")                
   # PPR      
   regFit(Y ~ X1 + X2 + X3, data = x, use = "ppr") 
   # NNET     
   regFit(Y ~ X1 + X2 + X3, data = x, use = "nnet") 
   
   # POLYMARS
   regFit(Y ~ X1 + X2 + X3, data = x, use = "polymars")



