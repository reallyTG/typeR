library(Power2Stage)


### Name: power.tsd.fC
### Title: Power calculation of adaptive 2-stage BE studies (2x2 crossover)
###   with a futility criterion for the point estimate of T/R or its 90% CI
### Aliases: power.tsd.fC power.2stage.fC

### ** Examples

# using all the defaults
power.tsd.fC(CV=0.25, n1=24)
# run-time ~1 sec
## Not run: 
##D # as above but storing the results
##D res <- power.tsd.fC(CV=0.25, n1=24)
##D # representation of the discrete distribution of n(total)
##D # via plot method of object with class "table" which creates a
##D # 'needle' plot
##D plot(res$ntable/sum(res$ntable), ylab="Density",
##D      xlab=expression("n"[total]), las=1,
##D      main=expression("Distribution of n"[total]))
## End(Not run)



