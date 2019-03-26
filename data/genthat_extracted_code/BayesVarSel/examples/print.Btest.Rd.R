library(BayesVarSel)


### Name: print.Btest
### Title: Print an object of class 'Btest'
### Aliases: print.Btest

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
##D 	crime.BF
##D 	
## End(Not run)



