library(diversitree)


### Name: make.geosse
### Title: Geographic State Speciation and Extinction Model
### Aliases: make.geosse starting.point.geosse
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

## The likelihood function
lik <- make.geosse(phy, phy$tip.state)

## With "true" parameter values
lik(pars) # -168.4791

## A guess at a starting point.
p <- starting.point.geosse(phy)

## Start an ML search from this point (takes a couple minutes to run).
## Not run: 
##D fit <- find.mle(lik, p, method="subplex")
##D logLik(fit) # -165.9965
##D 
##D ## Compare with sim values.
##D rbind(real=pars, estimated=round(coef(fit), 2))
##D 
##D ## A model with constraints on the dispersal rates.
##D lik.d <- constrain(lik, dA ~ dB)
##D fit.d <- find.mle(lik.d, p[-7])
##D logLik(fit.d) # -166.7076
##D 
##D ## A model with constraints on the speciation rates.
##D lik.s <- constrain(lik, sA ~ sB, sAB ~ 0)
##D fit.s <- find.mle(lik.s, p[-c(2,3)])
##D logLik(fit.s) # -169.0123
## End(Not run)

## "Skeletal tree" sampling is supported.  For example, if your tree
## includes all AB species, half of A species, and a third of B species,
## create the likelihood function like this:
lik.f <- make.geosse(phy, phy$tip.state, sampling.f=c(1, 0.5, 1/3))

## If you have external evidence that the base of your tree must have
## been in state 1, say (endemic to region A), you can fix the root 
## when computing the likelihood, like this:
lik(pars, root=ROOT.GIVEN, root.p=c(0,1,0))



