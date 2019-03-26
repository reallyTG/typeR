library(BayesVarSel)


### Name: Btest
### Title: Bayes factors and posterior probabilities for linear regression
###   models
### Aliases: Btest
### Keywords: package

### ** Examples


## Not run: 
##D #Analysis of Crime Data
##D #load data
##D data(UScrime)
##D #Model selection among the following models: (note model1 is nested in all the others)
##D model1<- y ~ 1 + Prob
##D model2<- y ~ 1 + Prob + Time
##D model3<- y ~ 1 + Prob + Po1 + Po2
##D model4<- y ~ 1 + Prob + So
##D model5<- y ~ .
##D 
##D #Equal prior probabilities for models:
##D crime.BF<- Btest(models=list(basemodel=model1,
##D 	ProbTimemodel=model2, ProbPolmodel=model3,
##D 	ProbSomodel=model4, fullmodel=model5), data=UScrime)
##D 
##D #Another configuration of prior probabilities of models:
##D crime.BF2<- Btest(models=list(basemodel=model1, ProbTimemodel=model2,
##D 	ProbPolmodel=model3, ProbSomodel=model4, fullmodel=model5),
##D 	data=UScrime, prior.models = "User", priorprobs=list(basemodel=1/8,
##D 	ProbTimemodel=1/8, ProbPolmodel=1/2, ProbSomodel=1/8, fullmodel=1/8))
##D #same as:
##D #crime.BF2<- Btest(models=list(basemodel=model1, ProbTimemodel=model2,
##D 	#ProbPolmodel=model3,ProbSomodel=model4, #fullmodel=model5), data=UScrime,
##D 	#prior.models = "User", priorprobs=list(basemodel=1, ProbTimemodel=1,
##D 	#ProbPolmodel=4, #ProbSomodel=1, fullmodel=1))
## End(Not run)



