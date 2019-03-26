library(depmixS4)


### Name: fit
### Title: Fit 'depmix' or 'mix' models
### Aliases: fit depmix.fit fit,depmix-method show,depmix.fitted-method
###   summary,depmix.fitted-method mix.fit fit,mix-method
###   show,mix.fitted-method summary,mix.fitted-method
### Keywords: methods

### ** Examples


data(speed)

# 2-state model on rt and corr from speed data set 
# with Pacc as covariate on the transition matrix
# ntimes is used to specify the lengths of 3 separate series
mod1 <- depmix(list(rt~1,corr~1),data=speed,transition=~Pacc,nstates=2,
	family=list(gaussian(),multinomial("identity")),ntimes=c(168,134,137))
# fit the model
set.seed(3)
fmod1 <- fit(mod1)
fmod1 # to see the logLik and optimization information
# to see the parameters
summary(fmod1)

# to see the posterior state sequence and associated delta probabilties
pst <- posterior(fmod1)

# testing viterbi states for new data
df <- data.frame(corr=c(1,0,1),rt=c(6.4,5.5,5.3),Pacc=c(0.6,0.1,0.1))
# define model with new data like above
modNew <- depmix(list(rt~1,corr~1),data=df,transition=~Pacc,nstates=2,
	family=list(gaussian(),multinomial("identity")))
# get parameters from estimated model
modNew <- setpars(modNew,getpars(fmod1))
# check the state sequence and probabilities
viterbi(modNew)

# same model, now with missing data
## Not run: 
##D speed[2,1] <- NA
##D speed[3,2] <- NA
##D 
##D # 2-state model on rt and corr from speed data set 
##D # with Pacc as covariate on the transition matrix
##D # ntimes is used to specify the lengths of 3 separate series
##D mod1ms <- depmix(list(rt~1,corr~1),data=speed,transition=~Pacc,nstates=2,
##D 	family=list(gaussian(),multinomial("identity")),ntimes=c(168,134,137))
##D # fit the model
##D set.seed(3)
##D fmod1ms <- fit(mod1ms)
## End(Not run)

# instead of the normal likelihood, we can also maximise the "classification" likelihood
# this uses the maximum a posteriori state sequence to assign observations to states
# and to compute initial and transition probabilities. 

fmod1b <- fit(mod1,emcontrol=em.control(classification="hard"))
fmod1b # to see the logLik and optimization information

# FIX SOME PARAMETERS

# get the starting values of this model to the optimized 
# values of the previously fitted model to speed optimization

pars <- c(unlist(getpars(fmod1)))

# constrain the initial state probs to be 0 and 1 
# also constrain the guessing probs to be 0.5 and 0.5 
# (ie the probabilities of corr in state 1)
# change the ones that we want to constrain
pars[1]=0
pars[2]=1 # this means the process will always start in state 2
pars[13]=0.5
pars[14]=0.5 # the corr parameters in state 1 are now both 0, corresponding the 0.5 prob
mod2 <- setpars(mod1,pars)

# fix the parameters by setting: 
free <- c(0,0,rep(c(0,1),4),1,1,0,0,1,1,1,1)
# fit the model
fmod2 <- fit(mod2,fixed=!free)

# likelihood ratio insignificant, hence fmod2 better than fmod1
llratio(fmod1,fmod2)


# ADDING SOME GENERAL LINEAR CONSTRAINTS

# set the starting values of this model to the optimized 
# values of the previously fitted model to speed optimization

## Not run: 
##D 
##D pars <- c(unlist(getpars(fmod2)))
##D pars[4] <- pars[8] <- -4
##D pars[6] <- pars[10] <- 10
##D mod3 <- setpars(mod2,pars)
##D 
##D # start with fixed and free parameters
##D conpat <- c(0,0,rep(c(0,1),4),1,1,0,0,1,1,1,1)
##D # constrain the beta's on the transition parameters to be equal
##D conpat[4] <- conpat[8] <- 2
##D conpat[6] <- conpat[10] <- 3
##D 
##D fmod3 <- fit(mod3,equal=conpat)
##D 
##D llratio(fmod2,fmod3)
##D 
##D # above constraints can also be specified using the conrows argument as follows
##D conr <- matrix(0,2,18)
##D # parameters 4 and 8 have to be equal, otherwise stated, their diffence should be zero,
##D # and similarly for parameters 6 & 10
##D conr[1,4] <- 1
##D conr[1,8] <- -1
##D conr[2,6] <- 1
##D conr[2,10] <- -1
##D 
##D # note here that we use the fitted model fmod2 as that has appropriate 
##D # starting values
##D fmod3b <- fit(mod3,conrows=conr,fixed=!free) # using free defined above
##D 
## End(Not run)

data(balance)
# four binary items on the balance scale task
mod4 <- mix(list(d1~1,d2~1,d3~1,d4~1), data=balance, nstates=2,
	family=list(multinomial("identity"),multinomial("identity"),
	multinomial("identity"),multinomial("identity")))

set.seed(1)
fmod4 <- fit(mod4)

## Not run: 
##D 
##D # add age as covariate on class membership by using the prior argument
##D mod5 <- mix(list(d1~1,d2~1,d3~1,d4~1), data=balance, nstates=2,
##D 	family=list(multinomial("identity"),multinomial("identity"),
##D 	multinomial("identity"),multinomial("identity")),
##D 	prior=~age, initdata=balance)
##D 
##D set.seed(1)
##D fmod5 <- fit(mod5)
##D 
##D # check the likelihood ratio; adding age significantly improves the goodness-of-fit
##D llratio(fmod5,fmod4)
##D 
## End(Not run)




