library(MBESS)


### Name: ss.aipe.c
### Title: Sample size planning for an ANOVA contrast from the Accuracy in
###   Parameter Estimation (AIPE) perspective
### Aliases: ss.aipe.c
### Keywords: design

### ** Examples

# Suppose the population error variance of some three-group ANOVA model
# is believed to be 40. The researcher is interested in the difference 
# between the mean of group 1 and the average of means of group 2 and 3. 
# To plan the sample size so that, with 90 percent certainty, the 
# obtained 95 percent full confidence interval width is no wider than 3:

ss.aipe.c(error.variance=40, c.weights=c(1, -0.5, -0.5), width=3, assurance=.90)



