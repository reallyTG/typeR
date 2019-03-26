library(latentnet)


### Name: simulate.ergmm
### Title: Draw from the distribution of an Exponential Random Graph Mixed
###   Model
### Aliases: simulate.ergmm simulate simulate.ergmm.model
### Keywords: cluster datagen graphs models nonlinear nonparametric

### ** Examples


#
# Fit a short MCMC run: just the MCMC.
#
data(sampson)
gest <- ergmm(samplike ~ euclidean(d=2,G=3),
              control=ergmm.control(burnin=100,interval=5,sample.size=100),tofit="mcmc")
#
# Draw from the posterior
#
g.sim <- simulate(gest)
plot(g.sim)
#
# Draw from the first draw from the posterior
#
g.sim <- with(gest,simulate(model,par=sample[[1]],prior=prior))
plot(g.sim)



