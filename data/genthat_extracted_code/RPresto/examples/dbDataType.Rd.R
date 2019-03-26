library(RPresto)


### Name: dbDataType,PrestoDriver-method
### Title: Return the corresponding presto data type for the given R
###   'object'
### Aliases: dbDataType,PrestoDriver-method

### ** Examples

drv <- RPresto::Presto()
dbDataType(drv, list())
dbDataType(drv, 1)
dbDataType(drv, NULL)
dbDataType(drv, list(list(list(a=Sys.Date()))))
dbDataType(drv, as.POSIXct('2015-03-01 00:00:00', tz='UTC'))
dbDataType(drv, Sys.time())
# Data types for ARRAY or MAP values can be tricky
all.equal('VARCHAR', dbDataType(drv, list(1, 2, 3L)))



