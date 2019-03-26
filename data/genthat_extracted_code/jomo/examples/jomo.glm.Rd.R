library(jomo)


### Name: jomo.glm
### Title: Joint Modelling Imputation Compatible with glm Model
### Aliases: jomo.glm

### ** Examples

   #First of all we attach the data (only for simplicity in these examples):
  
  attach(sldata)
  
  #Then we make sure sex is a factor:
  
  sex<-factor(sex)
  
  # we define the data frame with all the variables 
  
  data<-data.frame(measure,age, sex)
  
  # And the formula of the substantive lm model 
  # sex as an outcome only because it is the only binary variable in the dataset...
  
  formula<-as.formula(sex~age+measure)
  
  #And finally we run the imputation function:
  
  imp<-jomo.glm(formula,data, nburn=10, nbetween=10, nimp=2)
  
  # Note we are using only 10 iterations to avoid time consuming examples, 
  # which go against CRAN policies. In real applications we would use
  # much larger burn-ins (around 1000) and at least 5 imputations.
  
  



