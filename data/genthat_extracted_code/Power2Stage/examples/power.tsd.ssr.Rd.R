library(Power2Stage)


### Name: power.tsd.ssr
### Title: Power of 2-stage BE studies in 2x2 crossover designs with
###   interim sample size re-estimation
### Aliases: power.2stage.ssr power.tsd.ssr

### ** Examples

# Not run to comply with CRAN policy about examples' run-time;
# minimum number of sim's should be 1E5 for 'power', 1E6 sim's for 'alpha'
## Not run: 
##D power.tsd.ssr(alpha=0.05, n1=10, GMR=1, CV=0.239, targetpower=0.9,
##D               pmethod="ls", blind=TRUE, theta0=1.25)
##D # should give an alpha-inflation 0.072359 (run time <5 seconds)
##D # repeated with noncentral t-approximation
##D power.tsd.ssr(alpha=0.05, n1=10, GMR=1, CV=0.239, targetpower=0.9,
##D               pmethod="nct", blind=TRUE, theta0=1.25)
##D # should give an alpha-inflation 0.069789 (run time ~20 seconds)
##D #
##D # adjusted alpha to control the Type I Error, noncentral t-approx.
##D power.tsd.ssr(alpha=0.03505, n1=10, GMR=1, CV=0.239, targetpower=0.9,
##D               pmethod="nct", blind=TRUE, theta0=1.25)
##D # should control the TIE with 0.049877
## End(Not run)



