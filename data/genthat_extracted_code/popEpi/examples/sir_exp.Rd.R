library(popEpi)


### Name: sir_exp
### Title: Calculate SMR
### Aliases: sir_exp sir_lex sir_ag

### ** Examples


## Not run: 
##D BL <- list(fot = 0:5, per = c("2003-01-01","2008-01-01", "2013-01-01"))
##D 
##D ## Aggregated data
##D x1 <- lexpand(sire, breaks = BL, status = status != 0, 
##D               birth = bi_date, entry = dg_date, exit = ex_date,
##D               pophaz=popmort,
##D               aggre=list(sex, period = per, surv.int = fot))
##D sir_ag(x1, print = 'period')
##D 
##D 
##D # no aggreate or breaks
##D x2 <- lexpand(sire, status = status != 0, 
##D               birth = bi_date, entry = dg_date, exit = ex_date,
##D               pophaz=popmort)
##D sir_lex(x2, breaks = BL, print = 'per')
## End(Not run)




