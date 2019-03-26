library(diversitree)


### Name: make.geosse.t
### Title: Geographic State Speciation and Extinction Model: Time Dependent
###   Models
### Aliases: make.geosse.t
### Keywords: models

### ** Examples

## Parameter values
pars <- c(1.5, 0.5, 1.0, 0.7, 0.7, 2.5, 0.5)
names(pars) <- diversitree:::default.argnames.geosse()

## Simulate a tree
set.seed(5)
phy <- tree.geosse(pars, max.t=4, x0=0)

## See the data
statecols <- c("AB"="purple", "A"="blue", "B"="red")
plot(phy, tip.color=statecols[phy$tip.state+1], cex=0.5)

## Create your list of functions. Its length corresponds to the number
## of parameters (speciation, extinction and dispersal) you want to
## estimate.
## For an unconstrained model, at least 7 parameters are estimated for
## sA, sB, sAB, xA, xB, dA, dB.
## In the case you want to define a model with linear functions of
## speciation and extinction, and constant dispersal:
functions <- rep(c("linear.t", "constant.t"), c(5, 2))

## Create the likelihood function
lik <- make.geosse.t(phy, phy$tip.state, functions)

## This function will estimate a likelihood from 12 parameters.
argnames(lik)

## Imagine that you want to get an estimate of the likelihood from a
## known set of parameters.
pars <- c(0.01,0.001,0.01,0.001,0.01,0.001,0.02,0.002,0.02,0.002,0.1,0.1)
names(pars)<-argnames(lik)
lik(pars) # -640.1644

## A guess at a starting point from character independent birth-death
## model (constant across time) .
p <- starting.point.geosse(phy)

#it only gives 7 parameters for time-constant model.
names(p)

## it can be modified for time-dependent with a guess on the slopes of
## speciation and extinction rates.
p.t<-c(p[1],0.001,p[2],0.001,p[3],0.001,p[4],0.001,p[5],0.001,p[6],p[7])
names(p.t)<-argnames(lik)

## Start an ML search from this point (takes from one minute to a very
## long time depending on your computer).
## Not run: 
##D fit <- find.mle(lik, p.t, method="subplex")
##D fit$logLik
##D coef(fit)
## End(Not run)

## A model with constraints on the dispersal rates.
lik.d <- constrain(lik, dA ~ dB)

##Now dA and dB are the same parameter dB.
argnames(lik.d)

##The parameter dA must be removed from maximum likelihood initial parameters
## Not run: 
##D fit.d <- find.mle(lik.d, p.t[-which(names(p.t)=="dA")])
##D fit$logLik
##D coef(fit)
## End(Not run)



