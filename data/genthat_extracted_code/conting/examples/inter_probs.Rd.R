library(conting)


### Name: inter_probs
### Title: Calculate Posterior Probability of Each Term
### Aliases: inter_probs

### ** Examples

set.seed(1)
## Set seed for reproducibility
data(AOH)
## Load AOH data

test1<-bcct(formula=y~(alc+hyp+obe)^3,data=AOH,n.sample=100,prior="UIP")
## Starting from maximal model of saturated model do 100 iterations of MCMC
## algorithm.

inter_probs(test1,n.burnin=10,cutoff=0)
## Calculate posterior probabilities having used a burn-in phase of 
## 10 iterations and a cutoff of 0 (i.e. display all terms with 
## non-zero posterior probability). Will get the following:

#Posterior probabilities of log-linear parameters:
#            post_prob
#(Intercept)    1.0000
#alc            1.0000
#hyp            1.0000
#obe            1.0000
#alc:hyp        0.1778
#alc:obe        0.0000
#hyp:obe        0.4444
#alc:hyp:obe    0.0000

## Note that the MCMC chain (after burn-in) does not visit any models 
## with the alc:obe or alc:hyp:obe interactions.



