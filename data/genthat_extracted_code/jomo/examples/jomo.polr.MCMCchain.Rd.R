library(jomo)


### Name: jomo.polr.MCMCchain
### Title: polr Compatible JM Imputation - A tool to check convergence of
###   the MCMC
### Aliases: jomo.polr.MCMCchain

### ** Examples


  attach(sldata)
  
  #we make sure social is a factor:
  
  social<-factor(social)
  
  # we define the data frame with all the variables 
  
  data<-data.frame(measure,age, social)
  
  # And the formula of the substantive lm model 
  # social as an outcome only because it is the only binary variable in the dataset...
  
  formula<-as.formula(social~age+measure)
  
  #And finally we run the imputation function:
  
  imp<-jomo.polr.MCMCchain(formula,data, nburn=10)
  
  # Note we are using only 10 iterations to avoid time consuming examples,
  # which go against CRAN policies. In real applications we would use
  # much larger burn-ins (around 1000, to say the least).
  
  # We can check, for example, the convergence of the first element of beta:
  
  plot(c(1:10),imp$collectbeta[1,1,1:10],type="l")
  
  



