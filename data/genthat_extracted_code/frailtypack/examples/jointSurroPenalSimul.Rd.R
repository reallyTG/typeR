library(frailtypack)


### Name: jointSurroPenalSimul
### Title: Simulation studies based on the one-step Joint surrogate model
###   for the evaluation of a canditate surrogate endpoint
### Aliases: jointSurroPenalSimul

### ** Examples


## Not run: 
##D # Surrogacy model evaluation performance study based on 10 generated data
##D # (Computation takes around 30 minutes)
##D # To realize a simulation study on 100 samples or more (as required), use 
##D # nb.dataset = 100
##D 
##D joint.simul <- jointSurroPenalSimul(nb.dataset = 10, nbSubSimul=600, 
##D                    ntrialSimul=30, LIMparam = 0.001, LIMlogl = 0.001, 
##D                    LIMderiv = 0.001, nb.mc = 200, nb.gh = 20, 
##D                    nb.gh2 = 32, true.init.val = 1, print.itter=F)
##D 
##D # results
##D summary(joint.simul, d = 3, R2boot = 1) # bootstrap
##D summary(joint.simul, d = 3, R2boot = 0) # Delta-method
##D 
## End(Not run)




