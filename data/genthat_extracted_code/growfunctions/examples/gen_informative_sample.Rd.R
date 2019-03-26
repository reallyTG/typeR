library(growfunctions)


### Name: gen_informative_sample
### Title: Generate a finite population and take an informative single or
###   two-stage sample.
### Aliases: gen_informative_sample

### ** Examples

## Not run: 
##D library(growfunctions)
##D ## use gen_informative_sample() to generate an 
##D ## N X T population drawn from a dependent GP
##D ## By default, 3 clusters are used to generate 
##D ## the population.
##D ## A single stage stratified random sample of size n 
##D ## is drawn from the population using I = 4 strata. 
##D ## The resulting sample is informative in that the 
##D ## distribution for this sample is
##D ## different from the population from which 
##D ## it was drawn because the strata inclusion
##D ## probabilities are proportional to a feature 
##D ## of the response, y (in the case, the variance.
##D ## The stratified random sample over-samples 
##D ## large variance strata).
##D ## (The user may also select a 2-stage 
##D ## sample with the first stage
##D ## sampling "blocks" of the population and 
##D ## the second stage sampling strata within blocks). 
##D dat_sim        <- gen_informative_sample(N = 10000, 
##D                                 n = 500, T = 10,
##D                                 noise_to_signal = 0.1)
##D 
##D ## extract n x T observed sample under informative
##D ## stratified sampling design.
##D y_obs                       <- dat_sim$y_obs
##D T                           <- ncol(y_obs)
## End(Not run)



