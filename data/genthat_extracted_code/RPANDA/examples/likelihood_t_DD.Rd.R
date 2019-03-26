library(RPANDA)


### Name: likelihood_t_DD
### Title: Likelihood of a dataset under diversity-dependent models.
### Aliases: likelihood_t_DD

### ** Examples

data(Anolis.data)
phylo <- Anolis.data$phylo
pPC1 <- Anolis.data$data

# Compute the likelihood that the r value is twice the ML estimate for the DDexp model
par <- c(0.08148371, (2*-0.3223835))
lh <- -likelihood_t_DD(phylo,pPC1,par,model="DDexp")



