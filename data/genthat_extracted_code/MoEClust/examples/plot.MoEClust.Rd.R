library(MoEClust)


### Name: plot.MoEClust
### Title: Plot MoEClust Results
### Aliases: plot.MoEClust
### Keywords: main plotting

### ** Examples

## Not run: 
##D data(ais)
##D res <- MoE_clust(ais[,3:7], gating= ~ BMI, expert= ~ sex,
##D                  G=2, modelNames="EVE", network.data=ais)
##D 
##D # Plot the gating network
##D plot(res, what="gating")
##D 
##D # Plot the log-likelihood
##D plot(res, what="loglik")
##D 
##D # Plot the uncertainty profile
##D plot(res, what="uncertainty", type="profile")
##D 
##D # Produce a generalised pairs plot
##D plot(res, what="gpairs")
##D 
##D # Modify the gpairs plot by passing arguments to MoE_gpairs()
##D plot(res, what="gpairs", response.type="density",
##D      scatter.type="ci", jitter=FALSE, show.counts=FALSE)
## End(Not run)



