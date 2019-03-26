library(ev.trawl)


### Name: MoMGPD
### Title: Method of moments (MoM) on a one or multiple exceedance
###   timeseries for the latent trawl model using marginal GPD properties
###   and probability of exceedance.
### Aliases: MoMGPD

### ** Examples

exceed1 <- c(0.1, 0, 0.2, 0, 0, 0, 0.6, 1.5)
exceed2 <- c(0, 0.3, 5.2, 0, 0, 3.0, 0, 2.2)
val_array <- cbind(exceed1, exceed2)
MoMGPD(val_array)




