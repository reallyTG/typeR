library(MonetDBLite)


### Name: MonetDBLite
### Title: MonetDBLite DBI driver
### Aliases: MonetDBLite RMonetDBLite monetdblite rmonetdblite

### ** Examples

library(DBI)
con <- dbConnect(MonetDBLite::MonetDBLite())
dbDisconnect(con, shutdown=TRUE)



