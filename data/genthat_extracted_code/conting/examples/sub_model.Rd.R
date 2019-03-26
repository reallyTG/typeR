library(conting)


### Name: sub_model
### Title: Compute Posterior Summary Statistics for (Sub-) Models
### Aliases: sub_model

### ** Examples

set.seed(1)
## Set seed for reproducibility.

data(AOH)
## Load the AOH data

test1<-bcct(formula=y~(alc+hyp+obe)^3,data=AOH,n.sample=100,prior="UIP")
## Let the maximal model be the saturated model. Starting from the 
## posterior mode of the maximal model do 100 iterations under the unit 
## information prior.

test1sm<-sub_model(object=test1,order=1,n.burnin=10)
## Obtain posterior summary statistics for posterior modal model using a 
## burnin of 10.

test1sm

#Posterior model probability =  0.5
#
#Posterior summary statistics of log-linear parameters:
#            post_mean post_var lower_lim upper_lim
#(Intercept)  2.907059 0.002311   2.81725   2.97185
#alc1        -0.023605 0.004009  -0.20058   0.06655
#alc2        -0.073832 0.005949  -0.22995   0.10845
#alc3         0.062491 0.006252  -0.09635   0.18596
#hyp1        -0.529329 0.002452  -0.63301  -0.43178
#obe1         0.005441 0.004742  -0.12638   0.12031
#obe2        -0.002783 0.004098  -0.17082   0.07727
#NB: lower_lim and upper_lim refer to the lower and upper values of the
#95 % highest posterior density intervals, respectively
#
#Under the X2 statistic 
#
#Summary statistics for T_pred 
#   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
#  11.07   19.76   23.34   24.47   29.04   50.37 
#
#Summary statistics for T_obs 
#   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
#  30.82   34.78   35.74   36.28   37.45   42.49 
#
#Bayesian p-value =  0.0444




