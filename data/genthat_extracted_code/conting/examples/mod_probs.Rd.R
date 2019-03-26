library(conting)


### Name: mod_probs
### Title: Compute Posterior Model Probabilities
### Aliases: mod_probs

### ** Examples

set.seed(1)
## Set seed for reproducibility
data(AOH)
## Load AOH data

test1<-bcct(formula=y~(alc+hyp+obe)^3,data=AOH,n.sample=100,prior="UIP")
## Starting from maximal model of saturated model do 100 iterations of MCMC
## algorithm.

mod_probs(object=test1,n.burnin=10,best=6)
## Using a burn-in of 10 iterations find the posterior model probabilities 
## of the 6 models with the highest posterior model probability. Will get:

#Posterior model probabilities:
#  prob    model_formula                       
#1 0.50000 ~alc + hyp + obe                    
#2 0.32222 ~alc + hyp + obe + hyp:obe          
#3 0.12222 ~alc + hyp + obe + alc:hyp + hyp:obe
#4 0.05556 ~alc + hyp + obe + alc:hyp          
#
#Total number of models visited =  4

## Note that since the chain only visited 4 models we only get probabilities
## for 4 models not 6.



