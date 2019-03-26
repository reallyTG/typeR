library(MoEClust)


### Name: MoE_dens
### Title: Density for MoEClust Mixture Models
### Aliases: MoE_dens
### Keywords: clustering

### ** Examples

data(ais)
hema  <- ais[,3:7]
model <- MoE_clust(hema, G=3, gating= ~ BMI + sex, modelNames="EEE", network.data=ais)
Dens  <- MoE_dens(data=hema, mus=model$parameters$mean,
                  sigs=model$parameters$variance, log.tau=log(model$parameters$pro))

# Construct the z matrix and compute the log-likelihood
Estep <- MoE_estep(Dens=Dens)
(ll   <- Estep$loglik)

# Check that the z matrix & classification are the same as those from the model
identical(max.col(Estep$z), as.integer(unname(model$classification))) #TRUE
identical(Estep$z, model$z)                                           #TRUE

# The same can be done for models with expert covariates
m2    <- MoE_clust(hema, G=2, expert= ~ sex, modelNames="EVE", network.data=ais)
Dens2 <- MoE_dens(data=m2$resid.data, sigs=m2$parameters$variance,
                  mus=0, log.tau=log(m2$parameters$pro))



