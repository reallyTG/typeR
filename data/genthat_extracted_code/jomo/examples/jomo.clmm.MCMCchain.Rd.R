library(jomo)


### Name: jomo.clmm.MCMCchain
### Title: clmm Compatible JM Imputation - A tool to check convergence of
###   the MCMC
### Aliases: jomo.clmm.MCMCchain

### ** Examples


  attach(cldata)
  
  # make sure social is a factor:
  
  social<-factor(social)
  
  # we define the data frame with all the variables 
  
  data<-data.frame(measure,age, social, city)
  
  # And the formula of the substantive lm model 
  # social as an outcome only because it is the only ordinal variable in the dataset...
  
  formula<-as.formula(social~age+measure+(1|city))
  
  #And finally we run the imputation function:
  
  # imp<-jomo.clmm.MCMCchain(formula,data, nburn=100)
  
  # Note the example is commented out to avoid time consuming examples, 
  # which go against CRAN policies. 
  
  # We can check, for example, the convergence of the first element of beta:
  
  # plot(c(1:100),imp$collectbeta[1,1,1:100],type="l")
  
  



