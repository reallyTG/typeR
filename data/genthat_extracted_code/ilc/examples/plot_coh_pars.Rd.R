library(ilc)


### Name: plot_coh_pars
### Title: Miscellaneous plotting functions for 'lca.rh' type regression
###   objects. Plot of the cohort effects of the generalised Lee-Carter
###   model
### Aliases: plot_coh_pars
### Keywords: plots

### ** Examples

mod1 <- lca.rh(dd.cmi.pens, age=60:100, mod='m', interpolate=TRUE, res='dev', dec=1)
plot_coh_pars(mod1)



