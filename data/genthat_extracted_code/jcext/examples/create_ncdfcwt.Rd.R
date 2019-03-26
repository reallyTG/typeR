library(jcext)


### Name: create_ncdfcwt
### Title: create_ncdfcwt
### Aliases: create_ncdfcwt

### ** Examples

## No test: 
# This is a long running example
cwtGlobal <- extended_jc(press$msl, press$loni, press$lati, press$dates, gale=FALSE, num_cores=2)
# Create ncdf file (one file with all types)
create_ncdfcwt(cwtGlobal, press$dates, cwtGlobal$centralp, onefile = TRUE, path = NULL)
## End(No test)




