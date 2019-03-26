library(conting)


### Name: inter_stats
### Title: Compute Posterior Summary Statistics of the Log-Linear
###   Parameters.
### Aliases: inter_stats

### ** Examples

set.seed(1)
## Set seed for reproducibility
data(AOH)
## Load AOH data

test1<-bcct(formula=y~(alc+hyp+obe)^3,data=AOH,n.sample=100,prior="UIP")
## Starting from maximal model of saturated model do 100 iterations of MCMC
## algorithm.

inter_stats(test1,n.burnin=10,cutoff=0.5)
## Calculate posterior summary statistics having used a burn-in phase of 
## 10 iterations and a cutoff of 0 (i.e. display all terms with 
## non-zero posterior probability. Will get the following:

#Posterior summary statistics of log-linear parameters:
#            post_prob post_mean post_var lower_lim upper_lim
#(Intercept)         1   2.88291 0.002565   2.78778   2.97185
#alc1                1  -0.05246 0.008762  -0.27772   0.06655
#alc2                1  -0.05644 0.006407  -0.20596   0.11786
#alc3                1   0.06822 0.005950  -0.09635   0.18596
#hyp1                1  -0.53895 0.003452  -0.63301  -0.39888
#obe1                1  -0.04686 0.007661  -0.20929   0.12031
#obe2                1   0.01395 0.004024  -0.11024   0.11783
#NB: lower_lim and upper_lim refer to the lower and upper values of the
#95 % highest posterior density intervals, respectively




