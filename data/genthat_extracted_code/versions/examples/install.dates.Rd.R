library(versions)


### Name: install.dates
### Title: install.dates
### Aliases: install.dates

### ** Examples


## Not run: 
##D 
##D # install yesterday's version of checkpoint
##D install.dates('checkpoint', Sys.Date() - 1)
##D 
##D # install yesterday's versions of checkpoint and devtools
##D install.dates(c('checkpoint', 'devtools'), Sys.Date() - 1)
##D 
##D # install yesterday's version of checkpoint and the day before's devtools
##D install.dates(c('checkpoint', 'devtools'), Sys.Date() - 1:2)
##D 
## End(Not run)



