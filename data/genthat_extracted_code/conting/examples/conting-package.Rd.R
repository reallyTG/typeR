library(conting)


### Name: conting-package
### Title: Bayesian Analysis of Complete and Incomplete Contingency Tables
### Aliases: conting-package conting
### Keywords: package

### ** Examples

set.seed(1)
## Set seed for reproducibility
data(AOH)
## Load AOH data
test1<-bcct(formula=y~(alc+hyp+obe)^3,data=AOH,n.sample=100,prior="UIP")
## Bayesian analysis of complete contingency table. Let the saturated model
## be the maximal model and do 100 iterations.

summary(test1)
## Summarise the result. Will get:
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

set.seed(1)
## Set seed for reproducibility
data(spina)
## Load spina data
test2<-bict(formula=y~(S1+S2+S3+eth)^2,data=spina,n.sample=100,prior="UIP")
## Bayesian analysis of incomplete contingency table. Let the model with two-way 
## interactions be the maximal model and do 100 iterations.

summary(test2)
## Summarise the result. Will get:

#Posterior summary statistics of log-linear parameters:
#            post_prob post_mean post_var lower_lim upper_lim
#(Intercept)         1    1.0427 0.033967    0.6498    1.4213
#S11                 1   -0.3159 0.015785   -0.4477   -0.1203
#S21                 1    0.8030 0.018797    0.6127    1.1865
#S31                 1    0.7951 0.003890    0.6703    0.8818
#eth1                1    2.8502 0.033455    2.4075    3.1764
#eth2                1    0.1435 0.072437   -0.4084    0.5048
#S21:S31             1   -0.4725 0.002416   -0.5555   -0.3928
#NB: lower_lim and upper_lim refer to the lower and upper values of the
#95 % highest posterior density intervals, respectively
#
#Posterior model probabilities:
#  prob model_formula                                                         
#1 0.36 ~S1 + S2 + S3 + eth + S2:S3                                           
#2 0.19 ~S1 + S2 + S3 + eth + S2:S3 + S2:eth                                  
#3 0.12 ~S1 + S2 + S3 + eth + S1:eth + S2:S3                                  
#4 0.12 ~S1 + S2 + S3 + eth + S1:S2 + S1:S3 + S1:eth + S2:S3 + S2:eth + S3:eth
#5 0.10 ~S1 + S2 + S3 + eth + S1:S3 + S1:eth + S2:S3                          
#6 0.06 ~S1 + S2 + S3 + eth + S1:S3 + S1:eth + S2:S3 + S2:eth                 
#Total number of models visited =  8 
#
#Posterior mean of total population size = 726.75 
#95 % highest posterior density interval for total population size = ( 706 758 ) 
#
#Under the X2 statistic 
#
#Summary statistics for T_pred 
#   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
#  8.329  15.190  20.040  22.550  24.180 105.200 
#
#Summary statistics for T_obs 
#   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
# 5.329  18.270  22.580  21.290  24.110  37.940 
#
#Bayesian p-value =  0.45 



