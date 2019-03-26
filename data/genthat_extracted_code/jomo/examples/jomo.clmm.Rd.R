library(jomo)


### Name: jomo.clmm
### Title: Joint Modelling Imputation Compatible with Cumulative Link Mixed
###   Model
### Aliases: jomo.clmm

### ** Examples


  attach(cldata)
  
  # make sure social is a factor:
  
  sex<-factor(social)
  
  # we define the data frame with all the variables 
  
  data<-data.frame(measure,age, social, city)
  
  # And the formula of the substantive lm model 
  # social as an outcome only because it is the only ordinal variable in the dataset...
  
  formula<-as.formula(social~age+measure+(1|city))
  
  #And finally we run the imputation function:
  
  imp<-jomo.clmm(formula,data, nburn=2, nbetween=2, nimp=2)
  
  # Note we are using only 2 iterations to avoid time consuming examples, 
  # which go against CRAN policies. In real applications we would use
  # much larger burn-ins (around 1000) and at least 5 imputations.
  
  
  



