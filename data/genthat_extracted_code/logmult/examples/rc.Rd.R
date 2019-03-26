library(logmult)


### Name: rc
### Title: Fitting Row-Column Association Models
### Aliases: rc print.rc print.rc.symm
### Keywords: models nonlinear

### ** Examples

  ## Goodman (1991), Table 17.1 (p. 1097)
  data(criminal)
  model <- rc(criminal)

  model$assoc # These are the phi (.07), mu and nu
  model$assoc$row[,1,1] * model$assoc$phi[1,1] # These are the mu'
  model$assoc$col[,1,1] * model$assoc$phi[1,1] # These are the nu'

  ## Becker & Clogg (1989), Table 5 (p. 145)
  # See also ?rcL to run all models in one call
  ## Not run: 
##D   data(color)
##D 
##D   # "Uniform weights" in the authors' terms mean "no weighting" for us
##D   # See ?rcL for average marginals
##D   caithness.unweighted <- rc(color[,,1], nd=2, weighting="none",
##D                              se="jackknife")
##D   caithness.marginal <- rc(color[,,1], nd=2, weighting="marginal",
##D                            se="jackknife")
##D   aberdeen.unweighted <- rc(color[,,2], nd=2, weighting="none",
##D                             se="jackknife")
##D   aberdeen.marginal <- rc(color[,,2], nd=2, weighting="marginal",
##D                           se="jackknife")
##D 
##D   caithness.unweighted
##D   caithness.marginal
##D   aberdeen.unweighted
##D   aberdeen.marginal
##D 
##D   # To see standard errors, either:
##D   se(caithness.unweighted)
##D 
##D   # and so on...
##D   # (ours are much smaller for the marginal-weighted case)
##D   # Or:
##D   summary(caithness.unweighted)
##D   
## End(Not run)


  ## Clogg & Shihadeh (1994), Tables 3.5a and b (p. 55-61)
  data(gss88)
  model <- rc(gss88)

  # Unweighted scores
  summary(model, weighting="none")
  # Marginally weighted scores
  summary(model, weighting="marginal")
  # Uniformly weighted scores
  summary(model, weighting="uniform")


  ## Wong (2010), Table 2.7 (p. 48-49)
  ## Not run: 
##D   data(gss8590)
##D 
##D   # The table used in Wong (2001) is not perfectly consistent
##D   # with that of Wong (2010)
##D   tab <- margin.table(gss8590[,,c(2,4)], 1:2)
##D   tab[2,4] <- 49
##D 
##D   model <- rc(tab, nd=2, weighting="none", se="jackknife")
##D 
##D   model
##D   summary(model) # Jackknife standard errors are slightly different
##D                  # from their asymptotic counterparts
##D 
##D   # Compare with bootstrap standard errors
##D   model2 <- rc(tab, nd=2, weighting="none", se="bootstrap")
##D   plot(model, conf.int=0.95)
##D   summary(model2)
##D   
## End(Not run)



