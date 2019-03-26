library(soilDB)


### Name: fetchNASISLabData
### Title: Fetch lab data used site/horizon data from a PedonPC database.
### Aliases: fetchNASISLabData
### Keywords: manip

### ** Examples

## Not run: 
##D # query depends on some lab data, queried against the national database
##D # note that you must setup this connection ahead of time
##D # see inst/doc/setup_ODBC_local_NASIS.pdf
##D f <- fetchNASISLabData()
##D 
##D # plot only those profiles with densic contact
##D #plot(f[which(f$densic.contact), ], name='hzname')
##D 
## End(Not run)



