library(PKPDmisc)


### Name: set_groups
### Title: set groups
### Aliases: set_groups

### ** Examples

## Not run: 
##D gTheoph <- dplyr::group_by(Theoph, Subject)
##D grps <- capture_groups(gTheoph) # capture subject
##D theoph_cmax <- summarize(gTheoph, cmax = max(conc)) # lose Subject grouping
##D theoph_cmax <- set_groups(theoph_cmax, grps) # resets the original "Subject" grouping
## End(Not run)



