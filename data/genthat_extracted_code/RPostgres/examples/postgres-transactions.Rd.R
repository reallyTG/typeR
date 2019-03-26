library(RPostgres)


### Name: postgres-transactions
### Title: Transaction management.
### Aliases: postgres-transactions dbBegin,PqConnection-method
###   dbCommit,PqConnection-method dbRollback,PqConnection-method

### ** Examples

# For running the examples on systems without PostgreSQL connection:
run <- postgresHasDefault()

library(DBI)
if (run) con <- dbConnect(RPostgres::Postgres())
if (run) dbWriteTable(con, "USarrests", datasets::USArrests, temporary = TRUE)
if (run) dbGetQuery(con, 'SELECT count(*) from "USarrests"')

if (run) dbBegin(con)
if (run) dbExecute(con, 'DELETE from "USarrests" WHERE "Murder" > 1')
if (run) dbGetQuery(con, 'SELECT count(*) from "USarrests"')
if (run) dbRollback(con)

# Rolling back changes leads to original count
if (run) dbGetQuery(con, 'SELECT count(*) from "USarrests"')

if (run) dbRemoveTable(con, "USarrests")
if (run) dbDisconnect(con)



