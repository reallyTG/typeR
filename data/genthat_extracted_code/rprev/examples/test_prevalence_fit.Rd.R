library(rprev)


### Name: test_prevalence_fit
### Title: Test simulated prevalence fit.
### Aliases: test_prevalence_fit

### ** Examples

data(prevsim)

## Not run: 
##D 
##D obj <- prevalence(Surv(time, status) ~ age(age) + sex(sex) + entry(entrydate) + event(eventdate),
##D                   data=prevsim, num_years_to_estimate = c(5, 10), population_size=1e6,
##D                   start = "2005-09-01",
##D                   num_reg_years = 8, cure = 5)
##D 
##D test_prevalence_fit(obj)
## End(Not run)



