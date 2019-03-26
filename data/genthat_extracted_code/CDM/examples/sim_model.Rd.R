library(CDM)


### Name: sim_model
### Title: Simulate an Item Response Model
### Aliases: sim_model

### ** Examples

## Not run: 
##D #############################################################################
##D # EXAMPLE 1: GDINA model simulation
##D #############################################################################
##D 
##D data(sim.dina, package="CDM")
##D data(sim.qmatrix, package="CDM")
##D dat <- sim.dina
##D Q <- sim.qmatrix
##D 
##D # fit DINA model
##D mod <- CDM::gdina( dat, q.matrix=Q, rule="DINA")
##D summary(mod)
##D 
##D #** simulate new item responses (N equals observed sample size)
##D dat1 <- CDM::sim_model(mod)
##D 
##D #*** simulate item responses for N=2000 subjects
##D dat2 <- CDM::sim_model(mod, N_sim=2000)
##D str(dat2)
##D 
##D #*** simulate item responses based on input item response probabilities
##D #*** and theta_index
##D irfprob <- CDM::IRT.irfprob(mod)
##D prob.theta <- attr(irfprob, "prob.theta")
##D TP <- length(prob.theta)
##D theta_index <- sample(1:TP, size=1000, prob=prob.theta, replace=TRUE )
##D #-- simulate
##D dat3 <- CDM::sim_model(irfprob=irfprob, theta_index=theta_index)
##D str(dat3)
## End(Not run)



