library(rprev)


### Name: prevalence
### Title: Estimate point prevalence at an index date.
### Aliases: prevalence

### ** Examples

data(prevsim)

## Not run: 
##D data(prevsim)
##D 
##D prevalence(index='2013-01-30',
##D            num_years_to_estimate=c(3, 5, 10, 20),
##D            data=prevsim,
##D            inc_formula = entrydate ~ sex,
##D            surv_formula = Surv(time, status) ~ age + sex,
##D            dist='weibull',
##D            population_size = 1e6,
##D            death_column = 'eventdate')
## End(Not run)




