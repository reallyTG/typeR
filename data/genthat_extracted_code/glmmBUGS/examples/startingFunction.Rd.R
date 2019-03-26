library(glmmBUGS)


### Name: startingFunction
### Title: Write a function to generate random MCMC starting values
### Aliases: startingFunction

### ** Examples

##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.
sval = list(intercept=0, beta = 1:2, Rperson = rep(0, 5), vars=list(person=1))
startingFunction(sval)




