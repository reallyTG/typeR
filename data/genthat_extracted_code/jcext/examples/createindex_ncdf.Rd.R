library(jcext)


### Name: createindex_ncdf
### Title: createindex_ncdf
### Aliases: createindex_ncdf

### ** Examples

## No test: 
# This is a long running example
cwtGlobal <- extended_jc(press$msl, press$loni, press$lati, press$dates, gale=FALSE, num_cores=2)
# Create ncdf file (one file with all types)
createindex_ncdf(cwtGlobal, press$dates, cwtGlobal$centralp, path = NULL)
## End(No test)




