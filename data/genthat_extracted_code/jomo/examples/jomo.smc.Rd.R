library(jomo)


### Name: jomo.smc
### Title: Joint Modelling Substantive Model Compatible Imputation
### Aliases: jomo.smc

### ** Examples


  attach(cldata)
  
  # make sure sex is a factor:
  
  sex<-factor(sex)
  
  # we define the data frame with all the variables 
  
  data<-data.frame(measure,age, sex, city)
  mylevel<-c(1,1,1,1)
  
  # And the formula of the substantive lm model
  
  formula<-as.formula(measure~sex+age+I(age^2)+(1|city))
  
  #And finally we run the imputation function:
  
  imp<-jomo.smc(formula,data, level=mylevel, nburn=10, nbetween=10, model="lmer")
  
  # Note we are using only 10 iterations to avoid time consuming examples, 
  # which go against CRAN policies. 
  # If we were interested in a model with interactions:
  
  # formula2<-as.formula(measure~sex*age+(1|city))
  # imp2<-jomo.smc(formula2,data, level=mylevel, nburn=10, nbetween=10, model="lmer")
  
  # The analysis and combination steps are as for all the other functions
  # (see e.g. help file for jomo1con)
  
  
  



