library(dbhydroR)


### Name: clean_wq
### Title: Clean raw water quality DBHYDRO data retrievals
### Aliases: clean_wq cleanwq

### ** Examples

## Not run: 
##D #check handling of values below MDL
##D dt <- getwq("FLAB01", "2014-09-14", "2014-09-18", "NITRATE+NITRITE-N",
##D  raw = TRUE)
##D clean_wq(dt, mdl_handling = "raw")
##D clean_wq(dt, mdl_handling = "half")
## End(Not run)

dt <- read.csv(system.file("extdata", "testwq.csv", package = "dbhydroR"))
clean_wq(dt)



