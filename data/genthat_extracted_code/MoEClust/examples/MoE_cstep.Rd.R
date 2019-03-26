library(MoEClust)


### Name: MoE_cstep
### Title: C-step for MoEClust Models
### Aliases: MoE_cstep
### Keywords: clustering

### ** Examples

# MoE_cstep can be invoked for fitting MoEClust models via the CEM algorithm
# via the 'algo' argument to MoE_control:
data(ais)
hema   <- ais[,3:7]
model  <- MoE_clust(hema, G=3, gating= ~ BMI + sex, modelNames="EEE", network.data=ais, algo="CEM")
Dens   <- MoE_dens(data=hema, mus=model$parameters$mean,
                   sigs=model$parameters$variance, log.tau=log(model$parameters$pro))

# Construct the z matrix and compute the conditional log-likelihood
Cstep  <- MoE_cstep(Dens=Dens)
(ll    <- Cstep$loglik)

# Check that the z matrix & classification are the same as those from the model
identical(max.col(Cstep$z), as.integer(unname(model$classification))) #TRUE
identical(Cstep$z, model$z)                                           #TRUE

# Call MoE_cstep directly
Cstep2 <- MoE_cstep(data=hema, sigs=model$parameters$variance,
                    mus=model$parameters$mean, log.tau=log(model$parameters$pro))
identical(Cstep2$loglik, ll)                                          #TRUE



