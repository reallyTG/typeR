library(sppmix)


### Name: plot_chains
### Title: Plot MCMC chains
### Aliases: plot_chains

### ** Examples

## No test: 
fit <- est_mix_damcmc(pp = spatstat::redwood, m = 10)
plot(fit)
plot_chains(fit)
#plot the chains in the same plot with different colors
plot_chains(fit, separate = FALSE)
# Only plot the realizations for the component means
plot_chains(fit, chain = c("x", "y"))
#check labels
check_labels(fit)
#fix labels and plot the chains again
post_fixed = FixLS_da(fit, plot_result = TRUE)
plot_chains(post_fixed)
plot_chains(post_fixed, separate = FALSE)
#We work with the California Earthquake data. We fit an IPPP with intensity surface
#modeled by a mixture with 8 normal components.
CAfit=est_mix_damcmc(CAQuakes2014.RichterOver3.0, m=5, L = 20000)
#Now retrieve the surface of Maximum a Posteriori (MAP) estimates of the mixture parameter.
#Note that the resulting surface is not affected by label switching.
MAPsurf=GetMAPEst(CAfit)
#Plot the states and the earthquake locations along with the fitted MAP IPPP intensity surface
ret=PlotUSAStates(states=c('California','Nevada','Arizona'), showcentroids=FALSE,
 shownames=TRUE, main= "Earthquakes in CA, 2014", pp=CAQuakes2014.RichterOver3.0, surf=MAPsurf,
 boundarycolor="white", namescolor="white")
CAfit=est_mix_damcmc(pp = CAQuakes2014.RichterOver3.0, m = 5)
plot(CAfit)
check_labels(CAfit)
plot_chains(CAfit, separate = FALSE)
#fix labels and plot the chains again
post_fixedCA = FixLS_da(CAfit, plot_result = TRUE)
plot_chains(post_fixedCA, separate = FALSE)
## End(No test)




