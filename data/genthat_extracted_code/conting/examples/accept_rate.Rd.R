library(conting)


### Name: accept_rate
### Title: Compute Acceptance Rates for Metropolis-Hastings and Reversible
###   Jump Algorithms
### Aliases: accept_rate

### ** Examples

set.seed(1) ## set a seed for reproducibility
data(AOH)
test1<-bcct(formula=y~(alc+hyp+obe)^3,data=AOH,n.sample=500,prior="UIP")
## Create a bcct object for the AOH dataset for a very small number of
## iterations  (500).
accept_rate(test1)
## Calculate accept rates. Will get:

#Acceptance rate of reversible jump proposals =  32.5581 % 
#Acceptance rate of Metropolis-Hastings proposals =  76.8595 %




