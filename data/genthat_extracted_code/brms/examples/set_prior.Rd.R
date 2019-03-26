library(brms)


### Name: set_prior
### Title: Prior Definitions for 'brms' Models
### Aliases: set_prior brmsprior brmsprior-class prior prior_ prior_string

### ** Examples

## use alias functions
(prior1 <- prior(cauchy(0, 1), class = sd))
(prior2 <- prior_(~cauchy(0, 1), class = ~sd))
(prior3 <- prior_string("cauchy(0, 1)", class = "sd"))
identical(prior1, prior2)
identical(prior1, prior3)

## check which parameters can have priors
get_prior(rating ~ treat + period + carry + (1|subject),
          data = inhaler, family = cumulative())
         
## define some priors          
prior <- c(prior_string("normal(0,10)", class = "b"),
           prior(normal(1,2), class = b, coef = treat),
           prior_(~cauchy(0,2), class = ~sd, 
                  group = ~subject, coef = ~Intercept))
              
## verify that the priors indeed found their way into Stan's model code
make_stancode(rating ~ treat + period + carry + (1|subject),
              data = inhaler, family = cumulative(),
              prior = prior)
              
## use the horseshoe prior to model sparsity in population-level effects
make_stancode(count ~ log_Age_c + log_Base4_c * Trt_c,
              data = epilepsy, family = poisson(),
              prior = set_prior("horseshoe(3)"))
              
## alternatively use the lasso prior
make_stancode(count ~ log_Age_c + log_Base4_c * Trt_c,
              data = epilepsy, family = poisson(),
              prior = set_prior("lasso(1)"))

## pass priors to Stan without checking
prior <- prior_string("target += normal_lpdf(b[1] | 0, 1)", check = FALSE)
make_stancode(count ~ Trt_c, data = epilepsy, prior = prior)




