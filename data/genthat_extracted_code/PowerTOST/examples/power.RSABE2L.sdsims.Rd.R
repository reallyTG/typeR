library(PowerTOST)


### Name: power.RSABE2L.sdsims
### Title: (Empirical) Power of BE Decision via Reference Scaled ABE
### Aliases: power.RSABE2L.sdsims power.RSABE2L.sds

### ** Examples

# Not run due to timing policy of CRAN
## Not run: 
##D # pure EMA settings without mixed procedure, cap on widening and PE constraint
##D # as in the reference from 2017
##D reg           <- reg_const("EMA")
##D reg$CVswitch  <- 0
##D reg$CVcap     <- Inf
##D reg$pe_constr <- FALSE
##D reg$name      <- "EMA pure"
##D power.RSABE2L.sds(CV=0.4, n=12, theta0=exp(0.05), design="2x2x4",
##D                   regulator=reg, nsims=50000)
##D # should give:
##D # [1] 0.46504 (compared to 47.1% in the 2017 reference)
## End(Not run)



