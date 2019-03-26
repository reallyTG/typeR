library(regclass)


### Name: see_models
### Title: Examining model AICs from the "all possible" regressions
###   procedure using regsubsets
### Aliases: see.models see_models

### ** Examples

  
  data(SALARY)
	ALL <- regsubsets(Salary~.^2,data=SALARY,method="exhaustive",nbest=4)
	see_models(ALL)
	
	#By default, regsubsets considers up to 8 predictors, here it looks at up to 15
	data(ATTRACTF)
	ALL <- regsubsets(Score~.,data=ATTRACTF,nvmax=15,nbest=1)
	see_models(ALL,aicc=TRUE,report=5)
	 


