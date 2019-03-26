library(rprev)


### Name: summary.survfit.prev
### Title: Obtain N-year survival probability estimates.
### Aliases: summary.survfit.prev

### ** Examples

data(prevsim)

## Not run: 
##D prev_obj <- prevalence(Surv(time, status) ~ age(age) + sex(sex) +
##D                        entry(entrydate) + event(eventdate),
##D                        data=prevsim, num_years_to_estimate = c(5, 10),
##D                        population_size=1e6, start = "2005-09-01",
##D                        num_reg_years = 8, cure = 5)
##D 
##D survobj <- survfit(prev_obj, newdata=list(age=65, sex=0))
##D 
##D summary(survobj)
##D 
##D summary(survobj, years=c(1, 3, 5, 7))
## End(Not run)




