library(ilc)


### Name: fitted_plots
### Title: Miscellaneous plotting functions for 'lca' and 'lca.rh' type
###   regression objects
### Aliases: fitted_plots
### Keywords: plots

### ** Examples

mod6 <- lca.rh(dd.cmi.pens, mod='lc', max=110)
# send fitted plots with legends to 'fit.mod6.ps' file:
fitted_plots(mod6)
# send fitted plots without legends to active graphics window
fitted_plots(mod6, file=NULL, labs=FALSE)



