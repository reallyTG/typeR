library(RPANDA)


### Name: likelihood_t_MC
### Title: Likelihood of a dataset under the matching competition model.
### Aliases: likelihood_t_MC

### ** Examples

data(Anolis.data)
phylo <- Anolis.data$phylo
pPC1 <- Anolis.data$data

# Compute the likelihood that the S value is twice the ML estimate
par <- c(0.0003139751, (2*-0.06387258))
lh <- -likelihood_t_MC(phylo,pPC1,par)



