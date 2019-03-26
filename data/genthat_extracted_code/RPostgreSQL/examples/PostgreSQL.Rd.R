library(RPostgreSQL)


### Name: PostgreSQL
### Title: Instantiate a PostgreSQL client from the current R or S-Plus
###   session
### Aliases: PostgreSQL
### Keywords: interface database

### ** Examples
## Not run: 
##D # create a PostgreSQL instance and create one connection.
##D > m <- dbDriver("PostgreSQL")
##D <PostgreSQLDriver:(4378)>
##D 
##D > con <- dbConnect(m, user="username", password="passwd", dbname="database_name")
##D > rs <- dbSendQuery(con, "select * sales where price < 10")
##D > df <- fetch(rs, n = 50)
##D > dbHasCompleted(rs)
##D [1] FALSE
##D > df2 <- fetch(rs, n = -1)
##D > dbHasCompleted(rs)
##D [1] TRUE
##D > dbClearResult(rs)
##D > dbListTables(con)    
## End(Not run)



