library(bamlss)


### Name: simJM
### Title: Simulate longitudinal and survival data for joint models
### Aliases: simJM rJM
### Keywords: survival distribution

### ** Examples

## Not run: 
##D ## Simulate survival data
##D ## with functional random intercepts and a nonlinear effect 
##D ## of time, time-varying association alpha.
##D d <- simJM(nsub = 300)
##D head(d)
##D 
##D ## Simulate survival data
##D ## with random intercepts/slopes and a linear effect of time,
##D ## constant association alpha.
##D d <- simJM(nsub = 200, long_setting = "linear", 
##D   alpha_setting = "constant")
##D head(d)
## End(Not run)



