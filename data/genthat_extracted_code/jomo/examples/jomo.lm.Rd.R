library(jomo)


### Name: jomo.lm
### Title: Joint Modelling Imputation Compatible with Linear Regression
###   Model
### Aliases: jomo.lm

### ** Examples


  attach(sldata)
  
  # make sure sex is a factor:
  
  sex<-factor(sex)
  
  # we define the data frame with all the variables 
  
  data<-data.frame(measure,age, sex)
  
  # And the formula of the substantive lm model
  
  formula<-as.formula(measure~sex+age+I(age^2))
  
  #And finally we run the imputation function:
  
  imp<-jomo.lm(formula,data, nburn=100, nbetween=100)
  
  # Note we are using only 100 iterations to avoid time consuming examples, 
  # which go against CRAN policies. 
  # If we were interested in a model with interactions:
  
  formula2<-as.formula(measure~sex*age)
  imp2<-jomo.lm(formula2,data, nburn=100, nbetween=100)
  
  # The analysis and combination steps are as for all the other functions
  # (see e.g. help file for jomo1con)

  
  



