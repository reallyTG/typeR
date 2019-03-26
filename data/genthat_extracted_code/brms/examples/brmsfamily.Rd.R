library(brms)


### Name: brmsfamily
### Title: Special Family Functions for 'brms' Models
### Aliases: brmsfamily student bernoulli negbinomial geometric lognormal
###   shifted_lognormal skew_normal exponential weibull frechet
###   gen_extreme_value exgaussian wiener Beta von_mises asym_laplace
###   hurdle_poisson hurdle_negbinomial hurdle_gamma hurdle_lognormal
###   zero_inflated_beta zero_one_inflated_beta zero_inflated_poisson
###   zero_inflated_negbinomial zero_inflated_binomial categorical
###   cumulative sratio cratio acat

### ** Examples

 # create a family object
 (fam1 <- student("log"))
 # alternatively use the brmsfamily function
 (fam2 <- brmsfamily("student", "log"))
 # both leads to the same object
 identical(fam1, fam2) 




