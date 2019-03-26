library(InfoTrad)


### Name: YZ
### Title: Yan and Zhang (2012) Grid-Search based PIN Estimates
### Aliases: YZ print.YZ_class YZ_class

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
  
  Buy<-c(350,250,500,552,163,345,847,923,123,349)
  Sell<-c(382,500,463,550,200,323,456,342,578,455)
  data<-cbind(Buy,Sell)
  
  # Parameter estimates using the LK factorization of Lin and Ke (2011) 
  # with the algorithm of Yan and Zhang (2012).
  # Default factorization is set to be "LK"
  
  result=YZ(data)
  print(result)
  
  # Alpha: 0.3999999 
  # Delta: 0 
  # Mu: 442.1667 
  # Epsilon_b: 263.3333 
  # Epsilon_s: 424.9 
  # Likelihood Value: 44371.84 
  # PIN: 0.2004457 
  
  # Parameter estimates using the EHO factorization of Easley et. al. (2010) 
  # with the algorithm of Yan and Zhang (2012).
  
  result=YZ(data,likelihood="EHO")
  print(result)
  
  # Alpha: 0.9000001 
  # Delta: 0.9000001 
  # Mu: 489.1111 
  # Epsilon_b: 396.1803 
  # Epsilon_s: 28.72002 
  # Likelihood Value: Inf 
  # PIN: 0.3321033 




