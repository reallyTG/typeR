library(mkin)


### Name: mkinfit
### Title: Fit a kinetic model to data with one or more state variables
### Aliases: mkinfit
### Keywords: optimize

### ** Examples

# Use shorthand notation for parent only degradation
fit <- mkinfit("FOMC", FOCUS_2006_C, quiet = TRUE)
summary(fit)

# One parent compound, one metabolite, both single first order.
# Use mkinsub for convenience in model formulation. Pathway to sink included per default.
SFO_SFO <- mkinmod(
  parent = mkinsub("SFO", "m1"),
  m1 = mkinsub("SFO"))
# Fit the model to the FOCUS example dataset D using defaults
print(system.time(fit <- mkinfit(SFO_SFO, FOCUS_2006_D,
                           solution_type = "eigen", quiet = TRUE)))
coef(fit)
endpoints(fit)
## Not run: 
##D # deSolve is slower when no C compiler (gcc) was available during model generation
##D print(system.time(fit.deSolve <- mkinfit(SFO_SFO, FOCUS_2006_D,
##D                            solution_type = "deSolve")))
##D coef(fit.deSolve)
##D endpoints(fit.deSolve)
## End(Not run)

# Use stepwise fitting, using optimised parameters from parent only fit, FOMC
## Not run: 
##D FOMC_SFO <- mkinmod(
##D   parent = mkinsub("FOMC", "m1"),
##D   m1 = mkinsub("SFO"))
##D # Fit the model to the FOCUS example dataset D using defaults
##D fit.FOMC_SFO <- mkinfit(FOMC_SFO, FOCUS_2006_D, quiet = TRUE)
##D # Use starting parameters from parent only FOMC fit
##D fit.FOMC = mkinfit("FOMC", FOCUS_2006_D, quiet = TRUE)
##D fit.FOMC_SFO <- mkinfit(FOMC_SFO, FOCUS_2006_D, quiet = TRUE,
##D   parms.ini = fit.FOMC$bparms.ode)
##D 
##D # Use stepwise fitting, using optimised parameters from parent only fit, SFORB
##D SFORB_SFO <- mkinmod(
##D   parent = list(type = "SFORB", to = "m1", sink = TRUE),
##D   m1 = list(type = "SFO"))
##D # Fit the model to the FOCUS example dataset D using defaults
##D fit.SFORB_SFO <- mkinfit(SFORB_SFO, FOCUS_2006_D, quiet = TRUE)
##D fit.SFORB_SFO.deSolve <- mkinfit(SFORB_SFO, FOCUS_2006_D, solution_type = "deSolve",
##D                                  quiet = TRUE)
##D # Use starting parameters from parent only SFORB fit (not really needed in this case)
##D fit.SFORB = mkinfit("SFORB", FOCUS_2006_D, quiet = TRUE)
##D fit.SFORB_SFO <- mkinfit(SFORB_SFO, FOCUS_2006_D, parms.ini = fit.SFORB$bparms.ode, quiet = TRUE)
## End(Not run)

## Not run: 
##D # Weighted fits, including IRLS
##D SFO_SFO.ff <- mkinmod(parent = mkinsub("SFO", "m1"),
##D                       m1 = mkinsub("SFO"), use_of_ff = "max")
##D f.noweight <- mkinfit(SFO_SFO.ff, FOCUS_2006_D, quiet = TRUE)
##D summary(f.noweight)
##D f.irls <- mkinfit(SFO_SFO.ff, FOCUS_2006_D, reweight.method = "obs", quiet = TRUE)
##D summary(f.irls)
##D f.w.mean <- mkinfit(SFO_SFO.ff, FOCUS_2006_D, weight = "mean", quiet = TRUE)
##D summary(f.w.mean)
##D f.w.value <- mkinfit(SFO_SFO.ff, subset(FOCUS_2006_D, value != 0), err = "value",
##D                      quiet = TRUE)
##D summary(f.w.value)
## End(Not run)

## Not run: 
##D # Manual weighting
##D dw <- FOCUS_2006_D
##D errors <- c(parent = 2, m1 = 1)
##D dw$err.man <- errors[FOCUS_2006_D$name]
##D f.w.man <- mkinfit(SFO_SFO.ff, dw, err = "err.man", quiet = TRUE)
##D summary(f.w.man)
##D f.w.man.irls <- mkinfit(SFO_SFO.ff, dw, err = "err.man", quiet = TRUE,
##D                        reweight.method = "obs")
##D summary(f.w.man.irls)
## End(Not run)



