library(frailtypack)


### Name: summary.jointSurroPenalSimul
### Title: Short summary of the simulation studies based on a joint
###   surrogate model
### Aliases: summary.jointSurroPenalSimul
###   print.summary.jointSurroPenalSimul
### Keywords: methods

### ** Examples


# studies simulation
## Not run: 
##D # Studies simulation
##D # (Computation takes around 11 hours)
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





