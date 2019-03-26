library(InfoTrad)


### Name: EHO
### Title: Likelihood factorization of Easley et. al. (2010) - EHO
###   Factorization
### Aliases: EHO

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
  data=cbind(Buy,Sell)

  # Initial parameter values
  # par0 = (alpha, delta, mu, epsilon_b, epsilon_s)
  par0 = c(0.5,0.5,300,400,500)

  # Call EHO function
  EHO_out = EHO(data)
  model = optim(par0, EHO_out, gr = NULL, method = c("Nelder-Mead"), hessian = FALSE)

  ## Parameter Estimates
  model$par[1] # Estimate for alpha
  # [1] 0.9111102
  model$par[2] # Estimate for delta
  #[1] 0.0001231429
  model$par[3] # Estimate for mu
  # [1] 417.1497
  model$par[4] # Estimate for eb
  # [1] 336.075
  model$par[5] # Estimate for es
  # [1] 466.2539
  
  ## Estimate for PIN
  (model$par[1]*model$par[3])/((model$par[1]*model$par[3])+model$par[4]+model$par[5])
  # [1] 0.3214394
  ####




