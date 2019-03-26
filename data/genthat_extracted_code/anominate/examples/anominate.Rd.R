library(anominate)


### Name: anominate
### Title: alpha-NOMINATE: Ideal Point Estimator
### Aliases: anominate
### Keywords: ideal point estimation, NOMINATE, Bayesian latent variable
###   models

### ** Examples


## Don't show: 
data(sen111)
data(sen111_anom)
summary(sen111_anom)
## End(Don't show)

## Not run: 
##D data(sen111)
##D sen111_anom <- anominate(sen111, dims=1, polarity=2, nsamp=200, thin=1,
##D 	burnin=100, random.starts=FALSE, verbose=TRUE)
##D summary(sen111_anom)
##D ## Graphical summaries
##D plot(sen111_anom)
##D densplot.anominate(sen111_anom)
##D traceplot.anominate(sen111_anom)
## End(Not run)




