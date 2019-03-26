library(secrdesign)


### Name: predict.fittedmodels
### Title: Extract Estimates From Fitted Models
### Aliases: predict coef derived region.N predict.fittedmodels
###   coef.fittedmodels derived.fittedmodels region.N.fittedmodels
### Keywords: manip

### ** Examples


## Not run: 
##D scen1 <- make.scenarios(D = c(3,6), sigma = 25, g0 = 0.2)
##D traps1 <- make.grid()  ## default 6 x 6 grid of multi-catch traps
##D tmp1 <- run.scenarios(nrepl = 10, trapset = traps1, scenarios = scen1,
##D     fit = TRUE, extractfn = trim)
##D tmp2 <- predict(tmp1)
##D tmp3 <- select.stats(tmp2, 'D', c('estimate','RB','RSE'))
##D summary(tmp3)
##D 
##D ## for derived and region.N need more than just 'trimmed' secr object
##D ## use argument 'keep' to save mask and design0 usually discarded by trim
##D tmp4 <- run.scenarios(nrepl = 10, trapset = traps1, scenarios = scen1,
##D     fit = TRUE, extractfn = trim, keep = c('mask','design0'))
##D 
##D summary(derived(tmp4))
##D 
##D ## for region.N we must specify the parameter for which we want statistics
##D ## (default 'D' not relevant)
##D tmp5 <- select.stats(region.N(tmp4), parameter = 'E.N')
##D summary(tmp5)
## End(Not run)




