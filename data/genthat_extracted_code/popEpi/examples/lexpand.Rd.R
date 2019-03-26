library(popEpi)


### Name: lexpand
### Title: Split case-level observations
### Aliases: lexpand

### ** Examples

## Not run: 
##D ## prepare data for e.g. 5-year cohort survival calculation
##D x <- lexpand(sire, breaks=list(fot=seq(0, 5, by = 1/12)), 
##D              birth = bi_date, entry = dg_date, exit = ex_date,
##D              status =  status != 0, pophaz=popmort)
##D 
##D ## prepare data for e.g. 5-year "period analysis" for 2008-2012
##D BL <- list(fot = seq(0, 5, by = 1/12), per = c("2008-01-01", "2013-01-01"))
##D x <- lexpand(sire, breaks = BL, 
##D              birth = bi_date, entry = dg_date, exit = ex_date,
##D              pophaz=popmort, status =  status != 0)
##D 
##D ## aggregating
##D BL <- list(fot = 0:5, per = c("2003-01-01","2008-01-01", "2013-01-01"))
##D ag <- lexpand(sire, breaks = BL, status = status != 0, 
##D              birth = bi_date, entry = dg_date, exit = ex_date,
##D               aggre=list(sex, period = per, surv.int = fot))
##D 
##D ## aggregating even more
##D ag <- lexpand(sire, breaks = BL, status = status != 0, 
##D               birth = bi_date, entry = dg_date, exit = ex_date,
##D               aggre=list(sex, period = per, surv.int = fot),
##D               pophaz = popmort, pp = TRUE)
##D 
##D ## using "..."
##D x <- lexpand(sire, fot=0:5, status =  status != 0,
##D              birth = bi_date, entry = dg_date, exit = ex_date,
##D              pophaz=popmort) 
##D 
##D x <- lexpand(sire, fot=0:5, status =  status != 0, 
##D              birth = bi_date, entry = dg_date, exit = ex_date,
##D              aggre=list(sex, surv.int = fot))
##D              
##D ## using the "event" argument: it just places the transition to given "status"
##D ## at the "event" time instead of at the end, if possible using cutLexis
##D x <- lexpand(sire, status = status, event = dg_date,
##D              birth = bi_date, entry = dg_date, exit = ex_date,) 
##D 
##D ## aggregating with custom "event" time
##D ## (the transition to status is moved to the "event" time)
##D x <- lexpand(sire, status = status, event = dg_date, 
##D              birth = bi_date, entry = dg_date, exit = ex_date,
##D              per = 1970:2014, age = c(0:100,Inf),
##D              aggre = list(sex, year = per, agegroup = age)) 
##D 
## End(Not run)




