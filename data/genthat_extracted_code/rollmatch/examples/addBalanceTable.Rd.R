library(rollmatch)


### Name: addBalanceTable
### Title: Add the balancing table to the final output As it's an internal
###   helper function to aid in testing, it is not exported for use outside
###   of the package.
### Aliases: addBalanceTable
### Keywords: internal

### ** Examples

## Not run: 
##D  
##D fm <- as.formula(treat ~ qtr_pmt + yr_pmt + age + is_male + is_white +
##D                  is_disabled + is_esrd + months_dual + chron_num+lq_ed+
##D                  yr_ed2 + lq_ip + yr_ip2)
##D vars <- all.vars(formula); treat <- vars[1]
##D tm <- "quarter"; id <- "indiv_id"
## End(Not run)




