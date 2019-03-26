library(soilDB)


### Name: fetchPedonPC
### Title: Fetch commonly used site/horizon data from a PedonPC v.5
###   database.
### Aliases: fetchPedonPC getHzErrorsPedonPC
### Keywords: manip

### ** Examples

## Not run: 
##D # path to local PedonPC back-end DB
##D dsn <- "S:/Service_Center/NRCS/pedon/pedon.accdb"
##D 
##D # get routinely used soil data SoilProfileCollection object
##D f <- fetchPedonPC(dsn)
##D 
##D # plot only those profiles with densic contact
##D plot(f[which(f$densic.contact), ], name='hzname')
## End(Not run)



