library(jomo)


### Name: jomo.lm.MCMCchain
### Title: lm Compatible JM Imputation - A tool to check convergence of the
###   MCMC
### Aliases: jomo.lm.MCMCchain

### ** Examples


  attach(sldata)
  
  #make sure sex is a factor:
  
  sex<-factor(sex)
  
  # we define the data frame with all the variables 
  
  data<-data.frame(measure,age, sex)
  
  # And the formula of the substantive lm model
  
  formula<-as.formula(measure~sex+age+I(age^2))
  
  #And finally we run the imputation function:
  
  imp<-jomo.lm.MCMCchain(formula,data, nburn=100)
  
  # Note we are using only 100 iterations to avoid time consuming examples,
  # which go against CRAN policies. 
  
  # We can check, for example, the convergence of the first element of beta:
  
  plot(c(1:100),imp$collectbeta[1,1,1:100],type="l")
  
  



