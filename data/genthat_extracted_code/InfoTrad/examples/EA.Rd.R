library(InfoTrad)


### Name: EA
### Title: Ersan and Alici (2016) Cluster analysis with the altered steps.
### Aliases: EA print.EA_class EA_class print

### ** Examples
 
  # Sample Data
  #   Buy Sell 
  #1  350  382  
  #2  250  500  
  #3  500  463  
  #4  552  550  
  #5  163  200  
  #6  345  323  
  #7  847  456  
  #8  923  342  
  #9  123  578  
  #10 349  455   
  
  Buy=c(350,250,500,552,163,345,847,923,123,349)
  Sell=c(382,500,463,550,200,323,456,342,578,455)
  data=cbind(Buy,Sell)
  
  # Parameter estimates using the LK factorization of Lin and Ke (2011) 
  # with the modified clustering algorithm of Ersan and Alici (2016).
  # Default factorization is set to be "LK"
  
  result=EA(data)
  print(result)
  
  # Alpha: 0.9511418 
  # Delta: 0.2694005 
  # Mu: 76.7224 
  # Epsilon_b: 493.7045 
  # Epsilon_s: 377.4877 
  # Likelihood Value: 43973.71 
  # PIN: 0.07728924 
  
  
  # Parameter estimates using the EHO factorization of Easley et. al. (2010) 
  # with the modified clustering algorithm of Ersan and Alici (2016).
  
  result=EA(data,likelihood="EHO")
  print(result)
  
  # Alpha: 0.9511418 
  # Delta: 0.2694005 
  # Mu: 76.7224 
  # Epsilon_b: 493.7045 
  # Epsilon_s: 377.4877 
  # Likelihood Value: 43973.71 
  # PIN: 0.07728924 



