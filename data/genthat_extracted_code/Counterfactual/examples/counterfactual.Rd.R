library(Counterfactual)


### Name: counterfactual
### Title: Estimation and Inference Methods for Counterfactual Analysis
### Aliases: counterfactual QteDistEst BootstrapProcedure
###   InferenceTestingEval TestingEval VarianceEval getquantile
###   DiscreteInference
### Keywords: optimize manip regression models

### ** Examples


#Counterfactual distribution of X constructed by transformation of reference distribution
## Not run: 
##D 
##D data(engel)
##D attach(engel)
##D counter_income <- mean(income)+0.75*(income-mean(income))
##D rqres <- counterfactual(foodexp~income, counterfactual_var=counter_income,
##D nreg=100, transformation=TRUE, sepcore = TRUE, ncore=2)
## End(Not run)

# Wage decomposition: counterfactual and reference populations correspond to different groups
data(nlsw88)
attach(nlsw88)
lwage <- log(wage)

# method: logit
logitres<-counterfactual(lwage~tenure+ttl_exp+grade, group=union, treatment=TRUE, 
decomposition=TRUE, method="logit", noboot=TRUE, sepcore = TRUE,ncore=2)



