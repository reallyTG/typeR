library(ergm.ego)


### Name: ergm.ego
### Title: Inference for Exponential-Family Random Graph Models based on
###   Egocentrically Sampled Data
### Aliases: ergm.ego
### Keywords: models

### ** Examples


data(faux.mesa.high)
fmh.ego <- as.egodata(faux.mesa.high)

head(fmh.ego)

egofit <- ergm.ego(fmh.ego~edges+degree(0:3)+nodefactor("Race")+nodematch("Race")
                         +nodefactor("Sex")+nodematch("Sex")+absdiff("Grade"), 
                          popsize=network.size(faux.mesa.high))

# Run convergence diagnostics
mcmc.diagnostics(egofit)

# Estimates and standard errors
summary(egofit)

# Note that we recover the ergm() parameters
## Not run: 
##D coef(ergm(faux.mesa.high~edges+degree(0:3)+nodefactor("Race")+nodematch("Race")
##D                          +nodefactor("Sex")+nodematch("Sex")+absdiff("Grade"),
##D           eval.loglik=FALSE))
## End(Not run)
rbind(c(0, -0.8407, 2.3393, 1.4686, 0.6323, 0.5287, -1.3603, -1.0454,
        -2.4998, -0.7207, 0.833, -0.1823, 0.6357, -1.3513),
      coef(egofit))




