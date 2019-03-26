library(jomo)


### Name: jomo.glmer.MCMCchain
### Title: glmer Compatible JM Imputation - A tool to check convergence of
###   the MCMC
### Aliases: jomo.glmer.MCMCchain

### ** Examples


  attach(cldata)
  
  # make sure sex is a factor:
  
  sex<-factor(sex)
  
  # we define the data frame with all the variables 
  
  data<-data.frame(measure,age, sex, city)
  
  # And the formula of the substantive lm model 
  # sex as an outcome only because it is the only binary variable in the dataset...
  
  formula<-as.formula(sex~age+measure+(1|city))
  
  #And finally we run the imputation function:
  
  # imp<-jomo.glmer.MCMCchain(formula,data, nburn=100)
  
  # Note the example is commented out to avoid time consuming examples, 
  # which go against CRAN policies. 
  
  # We can check, for example, the convergence of the first element of beta:
  
  # plot(c(1:100),imp$collectbeta[1,1,1:100],type="l")
  
  



