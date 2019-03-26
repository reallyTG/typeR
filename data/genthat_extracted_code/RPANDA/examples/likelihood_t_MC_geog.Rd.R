library(RPANDA)


### Name: likelihood_t_MC_geog
### Title: Likelihood of a dataset under the matching competition model
###   with biogeography.
### Aliases: likelihood_t_MC_geog

### ** Examples

data(Anolis.data)
phylo <- Anolis.data$phylo
pPC1 <- Anolis.data$data
geography.object <-  Anolis.data$geography.object

# Compute the likelihood with geography using ML parameters for fit without geography
par <- c(0.0003139751, -0.06387258)
lh <- -likelihood_t_MC_geog(phylo,pPC1,par,geography.object)



