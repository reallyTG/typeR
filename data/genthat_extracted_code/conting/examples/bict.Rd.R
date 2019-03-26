library(conting)


### Name: bict
### Title: Bayesian Analysis of Incomplete Contingency Tables
### Aliases: bict bictu

### ** Examples

set.seed(1)
## Set seed for reproducibility.

data(spina)
## Load the spina data

test1<-bict(formula=y~(S1 + S2 + S3 + eth)^2,data=spina,n.sample=50, prior="UIP")
## Let the maximal model be the model with two-way interactions. Starting from the 
## posterior mode of the model with two-way interactions, do 50 iterations under the 
## unit information prior.

test1<-bictu(object=test1,n.sample=50)
## Do another 50 iterations

test1

#Number of cells in table = 24
#
#Maximal model =
#y ~ (S1 + S2 + S3 + eth)^2
#
#Number of log-linear parameters in maximal model = 15 
#
#Number of MCMC iterations = 100 
#
#Computer time for MCMC = 00:00:01 
#
#Prior distribution for log-linear parameters = UIP 
#
#Number of missing cells = 3 
#
#Number of censored cells = 0

summary(test1)
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
#
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
#  5.329  18.270  22.580  21.290  24.110  37.940 
#
#Bayesian p-value =  0.45





