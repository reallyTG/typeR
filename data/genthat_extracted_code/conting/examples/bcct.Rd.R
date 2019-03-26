library(conting)


### Name: bcct
### Title: Bayesian Analysis of Complete Contingency Tables
### Aliases: bcct bcctu bcctsubset bcctsubsetu

### ** Examples

set.seed(1)
## Set seed for reproducibility.

data(AOH)
## Load the AOH data

test1<-bcct(formula=y~(alc+hyp+obe)^3,data=AOH,n.sample=50,prior="UIP")
## Let the maximal model be the saturated model. Starting from the 
## posterior mode of the maximal model do 50 iterations under the unit 
## information prior.

test1<-bcctu(object=test1,n.sample=50)
## Do another 50 iterations

test1
## Printing out a bcct object produces this simple summary

#Number of cells in table = 24 
#
#Maximal model =
#y ~ (alc + hyp + obe)^3
#
#Number of log-linear parameters in maximal model = 24 
#
#Number of MCMC iterations = 100 
#
#Computer time for MCMC = 00:00:01 
#
#Prior distribution for log-linear parameters = UIP

summary(test1)
## Printing out a summary produces a bit more:

#Posterior summary statistics of log-linear parameters:
#            post_prob post_mean post_var lower_lim upper_lim
#(Intercept)         1  2.877924 0.002574   2.78778   2.97185
#alc1                1 -0.060274 0.008845  -0.27772   0.06655
#alc2                1 -0.049450 0.006940  -0.20157   0.11786
#alc3                1  0.073111 0.005673  -0.05929   0.20185
#hyp1                1 -0.544988 0.003485  -0.65004  -0.42620
#obe1                1 -0.054672 0.007812  -0.19623   0.12031
#obe2                1  0.007809 0.004127  -0.11024   0.11783
#NB: lower_lim and upper_lim refer to the lower and upper values of the
#95 % highest posterior density intervals, respectively
#
#Posterior model probabilities:
#  prob model_formula                                 
#1 0.45 ~alc + hyp + obe                              
#2 0.30 ~alc + hyp + obe + hyp:obe                    
#3 0.11 ~alc + hyp + obe + alc:hyp + hyp:obe          
#4 0.06 ~alc + hyp + obe + alc:hyp + alc:obe + hyp:obe
#5 0.05 ~alc + hyp + obe + alc:hyp                    
#
#Total number of models visited =  7 
#
#Under the X2 statistic 
#
#Summary statistics for T_pred 
#   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
#  11.79   20.16   23.98   24.70   28.77   52.40 
#
#Summary statistics for T_obs 
#   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
#   8.18   24.22   31.51   30.12   35.63   42.49 
#
#Bayesian p-value =  0.28

## For more examples see Overstall & King (2014).





