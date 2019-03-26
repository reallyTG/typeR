library(jomo)


### Name: jomo.lmer.MCMCchain
### Title: lmer Compatible JM Imputation - A tool to check convergence of
###   the MCMC
### Aliases: jomo.lmer.MCMCchain

### ** Examples


  attach(cldata)
  
  #Then we make sure sex is a factor:
  
  sex<-factor(sex)
  
  # we define the data frame with all the variables 
  
  data<-data.frame(measure,age, sex, city)
  mylevel<-c(1,1,1,1)
  
  # And the formula of the substantive lm model
  
  formula<-as.formula(measure~sex+age+I(age^2)+(1|city))
  
  #And finally we run the imputation function:
  
  imp<-jomo.lmer.MCMCchain(formula,data, level=mylevel, nburn=10)
  
  # Note we are using only 10 iterations to avoid time consuming examples, 
  # which go against CRAN policies. 
  
  # We can check, for example, the convergence of the first element of beta:
  
  plot(c(1:10),imp$collectbeta[1,1,1:10],type="l")
  
  



