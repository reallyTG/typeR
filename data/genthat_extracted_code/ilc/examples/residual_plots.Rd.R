library(ilc)


### Name: residual_plots
### Title: Miscellaneous plotting functions for 'lca' and 'lca.rh' type
###   regression objects.
### Aliases: residual_plots
### Keywords: plots

### ** Examples

mod6d <- lca.rh(dd.cmi.pens, mod='lc', restype='dev', interpolate=TRUE)
# send fitted plots with legends to 'res.mod6.ps' file:
residual_plots(mod6d)
# send fitted plots to active graphics window
residual_plots(mod6d, file=NULL)



