library(dynatopmodel)


### Name: run.dtm
### Title: Run Dynamic TOPMODEL against hydrometric data and a catchment
###   discretisation
### Aliases: run.dtm

### ** Examples

## Not run: 
##D require(dynatopmodel)
##D data(brompton)
##D 
##D # Examine the November 2012 event that flooded the village (see Metcalfe et al., 2017)
##D sel <- "2012-11-23 12:00::2012-12-01"
##D # Precalculated discretisation
##D disc <- brompton$disc
##D groups <- disc$groups
##D rain <- brompton$rain[sel]
##D # to 15 minute intervals
##D rain <- disaggregate_xts(rain, dt = 15/60)
##D # Reduce PE, seems a bit on high side and resulted in a weighting factor for the rainfall
##D pe <- brompton$pe[sel]/2
##D qobs <- brompton$qobs[sel]
##D 
##D # Here we apply the same parameter values to all groups.
##D # we could also consider a discontinuity at the depth of subsurface drains (~1m)
##D # or in areas more remote from the channel that do not contribute fast subsurface
##D # flow via field drainage
##D groups <- disc$groups
##D groups$m <- 0.0044
##D # Simulate impermeable clay soils
##D groups$td <-  33
##D groups$ln_t0 <- 1.15
##D groups$srz_max <- 0.1
##D qobs <- brompton$qobs[sel]
##D qt0 <- as.numeric(qobs[1,])
##D # initial root zone storage - almost full due to previous event
##D groups$srz0 <- 0.98
##D # Quite slow channel flow, which might be expected with the shallow and reedy
##D # low bedslope reaches with very rough banks comprising the major channel
##D groups$vchan <- 400
##D groups$vof <- 50
##D # Rain is supplied at hourly intervals: convert to 15 minutes
##D rain <- disaggregate_xts(rain, dt = 15/60)
##D weights <- disc$weights
##D # Output goes to a new window
##D graphics.off()
##D x11()
##D 
##D # Initial discharge from the observations
##D qt0 <- as.numeric(qobs[1,])
##D 
##D # Run the model across the November 2012 storm event
##D # using a 15 minute interval
##D run <- run.dtm(groups=groups,
##D                weights=weights,
##D                rain=rain,
##D                pe=pe,
##D                qobs=qobs,
##D                qt0=qt0,
##D                routing=brompton$routing,
##D                graphics.show=TRUE, max.q=2.4)
## End(Not run)




