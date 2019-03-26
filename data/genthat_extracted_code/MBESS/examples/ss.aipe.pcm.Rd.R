library(MBESS)


### Name: ss.aipe.pcm
### Title: Sample size planning for polynomial change models in
###   longitudinal study
### Aliases: ss.aipe.pcm
### Keywords: design multivariate

### ** Examples
 
## Not run: 
##D # An example used in Kelley and Rausch for the expected confidence interval 
##D # width (returns 278). Thus, a necessary sample size of 278 is required when 
##D # the duration of the study will be 4 units and the frequency of measurement 
##D # occasions is 1 year in order for the expected confidence interval 
##D # width to be 0.025 units.  
##D 
##D ss.aipe.pcm(true.variance.trend=0.003, error.variance=0.0262, duration=4, 
##D frequency=1, width=0.025, conf.level=.95)
##D 
##D # Now, when incorporating an assurance parameter (returns 316). 
##D # Thus, a necessary sample size of 316 will ensure that the 95% confidence 
##D # interval will be sufficiently narrow (i.e., have a width less than .025 units) 
##D # at least 99% of the time.
##D 
##D ss.aipe.pcm(true.variance.trend=.003, error.variance=.0262, duration=4, 
##D frequency=1, width=.025, conf.level=.95, assurance=.99)
## End(Not run)



