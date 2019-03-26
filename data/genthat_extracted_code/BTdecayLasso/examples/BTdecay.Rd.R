library(BTdecayLasso)


### Name: BTdecay
### Title: Bradley-Terry Model with Exponential Decayed weighted likelihood
### Aliases: BTdecay

### ** Examples

##Initializing Dataframe
x <- BTdataframe(NFL2010)

##Standard Bradley-Terry Model optimization
y <- BTdecay(x$dataframe, x$ability, decay.rate = 0, fixed = x$worstTeam)
summary(y)

##Dynamic approximation of current ability scores using exponential decayed likelihood.
##If we take decay.rate = 0.005
##Match happens one month before will weight exp(-0.15)=0.86 on log-likelihood function
z <- BTdecay(x$dataframe, x$ability, decay.rate = 0.005, fixed = x$worstTeam)
summary(z)



