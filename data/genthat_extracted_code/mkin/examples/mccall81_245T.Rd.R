library(mkin)


### Name: mccall81_245T
### Title: Datasets on aerobic soil metabolism of 2,4,5-T in six soils
### Aliases: mccall81_245T
### Keywords: datasets

### ** Examples

  SFO_SFO_SFO <- mkinmod(T245 = list(type = "SFO", to = "phenol"),
                         phenol = list(type = "SFO", to = "anisole"),
                         anisole = list(type = "SFO"))
  ## Not run: 
##D     fit.1 <- mkinfit(SFO_SFO_SFO, subset(mccall81_245T, soil == "Commerce"), quiet = TRUE)
##D     summary(fit.1, data = FALSE)
##D     # No convergence, no covariance matrix ...
##D     # k_phenol_sink is really small, therefore fix it to zero
##D     fit.2 <- mkinfit(SFO_SFO_SFO, subset(mccall81_245T, soil == "Commerce"),
##D                    parms.ini = c(k_phenol_sink = 0),
##D                    fixed_parms = "k_phenol_sink", quiet = TRUE)
##D     summary(fit.2, data = FALSE)
##D   
## End(Not run)



