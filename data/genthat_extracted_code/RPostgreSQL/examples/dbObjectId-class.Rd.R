library(RPostgreSQL)


### Name: dbObjectId-class
### Title: Class dbObjectId
### Aliases: dbObjectId-class
### Keywords: classes interface database

### ** Examples
## Not run: 
##D   pg <- dbDriver("PostgreSQL")
##D   con <- dbConnect(pg, "user", "password")
##D   is(pg, "dbObjectId")   ## True
##D   is(con, "dbObjectId")  ## True
##D   isPostgresqlIdCurrent(con)       ## True
##D   q("yes")
##D   \$ R 
##D   isPostgresqlIdCurrent(con)       ## False
## End(Not run)



