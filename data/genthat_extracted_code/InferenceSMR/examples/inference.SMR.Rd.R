library(InferenceSMR)


### Name: inference.SMR
### Title: Inference about the standardized mortality ratio (SMR) when
###   evaltuating the effect of a screening program on survival.
### Aliases: inference.SMR

### ** Examples

#This example uses pre-built objects and shows the simple usage
#of the est.expDeath function when those objects already exist.
#For an example of how to build those objects, refer to the 
#help page of the screening dataset.

#Estimating the variance can be very long even in this small sample example, e.g. a few hours.
#Remove "#" to run example :
#data(req.objects);
#cox.data = req.objects$cox.data;
#results = inference.SMR(obs.death = sum(screening$deathSCN),
# normal = c("smr", "log-smr", "root-smr"),
#	 alpha = 0.05, req.objects$contribution, req.objects$incid,
#	 cox = req.objects$cox, fuzz = 0.01, Poisson = TRUE, req.objects$covnames);


#********  INFERENCE ABOUT THE SMR  ********* 
#
#Observed =  18  Expected =  33.44264 
#Obs.var. =  18  Exp.var. =  39.38153 
#SMR =  0.5382351 
#
# 95 % Confidence intervals with normality assumption at : 
#
#The SMR level : ( 0.2204119 0.8560583 )
#
#The log-SMR level : ( 0.2982118 0.9714471 )
#
#The root-SMR level : ( 0.2673299 0.9029762 )

#results
#
#$expected
#[1] 33.44264
#
#$obs.death
#[1] 18
#
#$variance
#            2
#[1,] 39.38153
#
#$smr
#[1] 0.5400112
#
#$smr.var
#              2
#[1,] 0.02629511
#
#$smr.ci
#[1] 0.2204119 0.8560583
#
#$logSMR.var
#              2
#[1,] 0.09076763
#
#$logSMR.ci
#[1] 0.2982118 0.9714471
#
#$rootSMR.var
#              2
#[1,] 0.01221358
#
#$rootSMR.ci
#[1] 0.2673299 0.9029762






