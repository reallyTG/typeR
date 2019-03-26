library(jomo)


### Name: jomo.glmer
### Title: Joint Modelling Imputation Compatible with Generalized Linear
###   Mixed Model
### Aliases: jomo.glmer

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
  
  imp<-jomo.glmer(formula,data, nburn=2, nbetween=2, nimp=2)
  
  # Note we are using only 2 iterations to avoid time consuming examples, 
  # which go against CRAN policies. In real applications we would use
  # much larger burn-ins (around 1000) and at least 5 imputations.
  
  
  



