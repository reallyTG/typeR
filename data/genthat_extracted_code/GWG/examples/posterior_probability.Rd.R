library(GWG)


### Name: posterior_probability
### Title: Posterior probability of disease given prevalence and positive
###   or negative likelihood ratio of a test
### Aliases: posterior_probability
### Keywords: posterior probability

### ** Examples

##Prevalence is 0.5 and the positive likelihood ratio is 3:
posterior_probability(0.5, lrpos=3)

#The probability of disease given test is positive is 0.75.


##Prevalence is 0.5 and the negative likelihood ratio is 0.5:
posterior_probability(0.5, lrneg=0.5, posterior_odds=TRUE)

#The probability of no disease is 0.66 given test is negative and the 
#corresponding posterior odds is 0.5.



