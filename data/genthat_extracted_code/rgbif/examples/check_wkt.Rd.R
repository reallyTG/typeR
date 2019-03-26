library(rgbif)


### Name: check_wkt
### Title: Check input WKT
### Aliases: check_wkt

### ** Examples

## Not run: 
##D check_wkt('POLYGON((30.1 10.1, 10 20, 20 60, 60 60, 30.1 10.1))')
##D check_wkt('POINT(30.1 10.1)')
##D check_wkt('LINESTRING(3 4,10 50,20 25)')
##D 
##D # check many passed in at once
##D check_wkt(c('POLYGON((30.1 10.1, 10 20, 20 60, 60 60, 30.1 10.1))',
##D   'POINT(30.1 10.1)'))
##D 
##D # bad WKT
##D # wkt <- 'POLYGON((30.1 10.1, 10 20, 20 60, 60 60, 30.1 a))'
##D # check_wkt(wkt)
##D 
##D # many wkt's, semi-colon separated, for many repeated "geometry" args
##D wkt <- "POLYGON((-102.2 46.0,-93.9 46.0,-93.9 43.7,-102.2 43.7,-102.2 46.0))
##D ;POLYGON((30.1 10.1, 10 20, 20 40, 40 40, 30.1 10.1))"
##D check_wkt(gsub("\n", '', wkt))
## End(Not run)



