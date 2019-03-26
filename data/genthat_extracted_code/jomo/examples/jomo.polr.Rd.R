library(jomo)


### Name: jomo.polr
### Title: Joint Modelling Imputation Compatible with Proportional Odds
###   Ordinal Probit Regression
### Aliases: jomo.polr

### ** Examples

   #First of all we attach the data (only for simplicity in these examples):
  
  attach(sldata)
  
  #Then we make sure social is a factor:
  
  social<-factor(social)
  
  # we define the data frame with all the variables 
  
  data<-data.frame(measure,age, social)
  
  # And the formula of the substantive lm model 
  # social as an outcome only because it is the only binary variable in the dataset...
  
  formula<-as.formula(social~age+measure)
  
  #And finally we run the imputation function:
  
  imp<-jomo.polr(formula,data, nburn=10, nbetween=10, nimp=2)
  
  # Note we are using only 10 iterations to avoid time consuming examples, 
  # which go against CRAN policies. In real applications we would use
  # much larger burn-ins (around 1000) and at least 5 imputations.
  
  



