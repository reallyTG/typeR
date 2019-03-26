library(bayou)


### Name: make.prior
### Title: Make a prior function for bayou
### Aliases: make.prior

### ** Examples

## Load data
data(chelonia)
tree <- chelonia$phy
dat <- chelonia$dat

#Create a prior that allows only one shift per branch with equal probability 
#across branches
prior <- make.prior(tree, dists=list(dalpha="dlnorm", dsig2="dlnorm",
           dsb="dsb", dk="cdpois", dtheta="dnorm"), 
             param=list(dalpha=list(meanlog=-5, sdlog=2), 
               dsig2=list(meanlog=-1, sdlog=5), dk=list(lambda=15, kmax=200), 
                 dsb=list(bmax=1,prob=1), dtheta=list(mean=mean(dat), sd=2)))
             
#Evaluate some parameter sets
pars1 <- list(alpha=0.1, sig2=0.1, k=5, ntheta=6, theta=rnorm(6, mean(dat), 2), 
                 sb=c(32, 53, 110, 350, 439), loc=rep(0.1, 5), t2=2:6)
pars2 <- list(alpha=0.1, sig2=0.1, k=5, ntheta=6, theta=rnorm(6, mean(dat), 2),
                 sb=c(43, 43, 432, 20, 448), loc=rep(0.1, 5), t2=2:6)
prior(pars1) 
prior(pars2) #-Inf because two shifts on one branch

#Create a prior that allows any number of shifts along each branch with probability proportional 
#to branch length
prior <- make.prior(tree, dists=list(dalpha="dlnorm", dsig2="dlnorm",
           dsb="dsb", dk="cdpois", dtheta="dnorm"), 
             param=list(dalpha=list(meanlog=-5, sdlog=2), 
               dsig2=list(meanlog=-1, sdlog=5), dk=list(lambda=15, kmax=200), 
                 dsb=list(bmax=Inf,prob=tree$edge.length), 
                   dtheta=list(mean=mean(dat), sd=2)))
prior(pars1)
prior(pars2)

#Create a prior with fixed regime placement and sigma^2 value
prior <- make.prior(tree, dists=list(dalpha="dlnorm", dsig2="fixed", 
           dsb="fixed", dk="fixed", dtheta="dnorm", dloc="dunif"), 
             param=list(dalpha=list(meanlog=-5, sdlog=2), 
               dtheta=list(mean=mean(dat), sd=2)), 
                 fixed=list(sig2=1, k=3, ntheta=4, sb=c(447, 396, 29)))
                 
pars3 <- list(alpha=0.01, theta=rnorm(4, mean(dat), 2), loc=rep(0.1, 4))
prior(pars3)

##Return a list of functions used to calculate prior
attributes(prior)$functions

##Return parameter values used in prior distribution
attributes(prior)$parameters



