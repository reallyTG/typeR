library(sjlabelled)


### Name: read_spss
### Title: Import data from other statistical software packages
### Aliases: read_spss read_sas read_stata

### ** Examples

## Not run: 
##D # import SPSS data set. uses haven's read function
##D mydat <- read_spss("my_spss_data.sav")
##D 
##D # use haven's read function, convert atomic to factor
##D mydat <- read_spss("my_spss_data.sav", atomic.to.fac = TRUE)
##D 
##D # retrieve variable labels
##D mydat.var <- get_label(mydat)
##D 
##D # retrieve value labels
##D mydat.val <- get_labels(mydat)
## End(Not run)




