library(regclass)


### Name: check_regression
### Title: Linear and Logistic Regression diagnostics
### Aliases: check.regression check_regression

### ** Examples

  #Simple linear regression where everything looks good 
  data(FRIEND)
  M <- lm(FriendshipPotential~Attractiveness,data=FRIEND)
  check_regression(M)
  
  #Multiple linear regression (prompt is FALSE only for documentation)
  data(AUTO)
  M <- lm(FuelEfficiency~.,data=AUTO)
  check_regression(M,extra=TRUE,prompt=FALSE)
  
  
  #Multiple linear regression with a categorical predictors and an interaction
  data(TIPS)
  M <- lm(TipPercentage~Bill*PartySize*Weekday,data=TIPS)
  check_regression(M)
  
  #Multiple linear regression with polynomial term (prompt is FALSE only for documentation)
  #Note:  in this example only plots are provided
  data(BULLDOZER)
  M <- lm(SalePrice~.-YearMade+poly(YearMade,2),data=BULLDOZER)
  check_regression(M,extra=TRUE,tests=FALSE,prompt=FALSE)

  #Simple logistic regression.  Use 8 categories since only 8 unique values of Dose
  data(POISON)
	M <- glm(Outcome~Dose,data=POISON,family=binomial)
	check_regression(M,n.cats=8,seed=892)

  #Multiple logistic regression
  data(WINE)
  M <- glm(Quality~.,data=WINE,family=binomial)
	check_regression(M,seed=2010)

  
	 


