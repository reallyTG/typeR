library(MBESS)


### Name: ss.aipe.c.ancova
### Title: Sample size planning for a contrast in randomized ANCOVA from
###   the Accuracy in Parameter Estimation (AIPE) perspective
### Aliases: ss.aipe.c.ancova
### Keywords: design

### ** Examples

# Suppose the population error variance of some three-group ANOVA model
# is believed to be 40, and the population correlation coefficient 
# of the response and the covariate is 0.22. The researcher is 
# interested in the difference between the mean of group 1 and 
# the average of means of group 2 and 3. To plan the sample size so 
# that, with 90 percent certainty, the obtained 95 percent full 
# confidence interval width is no wider than 3:

ss.aipe.c.ancova(error.var.anova=40, rho=.22, 
c.weights=c(1, -0.5, -0.5), width=3, assurance=.90)



