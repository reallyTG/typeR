library(logmult)


### Name: rcL
### Title: Fitting Row-Column Association Models With Layer Effect
### Aliases: rcL print.rcL print.rcL.symm
### Keywords: models nonlinear

### ** Examples

  ## Becker & Clogg (1989), Table 5 (p. 145)
  # See also ?rc for more details
  ## Not run: 
##D   data(color)
##D 
##D   # "Uniform weights" in the authors' terms mean "no weighting" for us,
##D   # and "average marginals" means "marginal" with rcL
##D   # See ?rc for "marginals"
##D   unweighted <- rcL(color, nd=2, weighting="none",
##D                     layer.effect="heterogeneous", se="jackknife")
##D   marginal <- rcL(color, nd=2, weighting="marginal",
##D                   layer.effect="heterogeneous", se="jackknife")
##D   unweighted
##D   marginal
##D 
##D   # (our standard errors are much smaller for the marginal-weighted case)
##D   summary(unweighted)
##D   summary(marginal)
##D 
##D   opar <- par(mfrow=c(1, 2))
##D   plot(marginal, layer="Caithness", conf.int=0.95)
##D   plot(marginal, layer="Aberdeen", conf.int=0.95)
##D   par(opar)
##D   
## End(Not run)


  ## Wong (2010), Table 4.6 (p. 103), model 9
  ## Not run: 
##D   data(gss7590)
##D 
##D   model <- rcL(gss7590, nd=2, weighting="none", se="jackknife")
##D 
##D   model
##D   summary(model) # Jackknife standard errors are slightly different
##D                  # from their asymptotic counterparts
##D 
##D   # See ?plot.rcL for plotting
##D   
## End(Not run)



