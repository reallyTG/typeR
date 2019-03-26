library(regclass)


### Name: visualize_model
### Title: Visualizations of one or two variable linear or logistic
###   regressions or of partitions models
### Aliases: visualize_model visualize.model

### ** Examples

  data(SALARY)
  #Simple linear regression with 90% confidence and prediction intervals
  M <- lm(Salary~Education,data=SALARY)
  visualize_model(M,level=0.90,loc="bottomright")
  
  #Multiple linear regression with two quantitative predictors (no interaction)
  M <- lm(Salary~Education+Experience,data=SALARY)
  visualize_model(M)

  #Multiple linear regression with two quantitative predictors (with interaction)
  #Take small and large to be the 25th and 75th percentiles
  M <- lm(Salary~Education*Experience,data=SALARY)
  visualize_model(M,level=0.75)
  
  #Multiple linear regression with one categorical and one quantitative predictor
  M <- lm(Salary~Education*Gender,data=SALARY)
  visualize_model(M)

  data(WINE)
  #Simple logistic regression with expanded x limits
  M <- glm(Quality~alcohol,data=WINE,family=binomial)
  visualize_model(M,xlim=c(0,20))

  #Multiple logistic regression with two quantitative predictors
  M <- glm(Quality~alcohol*sulphates,data=WINE,family=binomial)
  visualize_model(M,loc="left")

  data(TIPS)
  #Multiple logistic regression with one categorical and one quantitative predictor
  #expanded x-limits to see more of the curve
  M <- glm(Smoker~PartySize*Weekday,data=TIPS,family=binomial)
  visualize_model(M,loc="topright",xlim=c(-5,15))
  
  #Partition model predicting a quantitative response
  TREE <- rpart(Salary~.,data=SALARY)
  visualize_model(TREE)
  
  #Partition model predicting a categorical response
  TREE <- rpart(Quality~.,data=WINE)
  visualize_model(TREE)



