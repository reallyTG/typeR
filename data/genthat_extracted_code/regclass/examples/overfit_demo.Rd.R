library(regclass)


### Name: overfit_demo
### Title: Demonstration of overfitting
### Aliases: overfit.demo overfit_demo

### ** Examples

  #Overfitting occurs after about 10 predictors (AIC begins to increase after 12/13)
  data(BODYFAT)
  overfit_demo(BODYFAT,y="BodyFat",seed=1010)
  
  #Overfitting occurs after about 5 predictors (AIC begins to increase after about 18)
  data(OFFENSE)
  overfit_demo(OFFENSE,y="Win",seed=1997)
	 


