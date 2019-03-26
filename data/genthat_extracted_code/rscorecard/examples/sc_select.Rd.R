library(rscorecard)


### Name: sc_select
### Title: Select scorecard data variables.
### Aliases: sc_select sc_select_

### ** Examples

## Not run: 
##D sc_select(UNITID)
##D sc_select(UNITID, INSTNM)
##D sc_select(unitid, instnm)
## End(Not run)
## Not run: 
##D sc_select_('UNITID')
##D sc_select_(c('UNITID', 'INSTNM'))
##D sc_select_(c('unitid', 'instnm'))
##D 
##D ## stored in object
##D vars_to_pull <- c('unitid','instnm')
##D sc_select(vars_to_pull)
## End(Not run)




