library(brms)


### Name: get_prior
### Title: Overview on Priors for 'brms' Models
### Aliases: get_prior

### ** Examples

## get all parameters and parameters classes to define priors on
(prior <- get_prior(count ~ log_Age_c + log_Base4_c * Trt_c
                    + (1|patient) + (1|visit),
                    data = epilepsy, family = poisson()))   
         
## define a prior on all population-level effects a once
prior$prior[1] <- "normal(0,10)"

## define a specific prior on the population-level effect of Trt_c
prior$prior[5] <- "student_t(10, 0, 5)"       

## verify that the priors indeed found their way into Stan's model code
make_stancode(count ~ log_Age_c + log_Base4_c * Trt_c 
              + (1|patient) + (1|visit),
              data = epilepsy, family = poisson(), 
              prior = prior)




