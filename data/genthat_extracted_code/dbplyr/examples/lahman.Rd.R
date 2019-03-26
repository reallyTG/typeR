library(dbplyr)


### Name: lahman
### Title: Cache and retrieve an 'src_sqlite' of the Lahman baseball
###   database.
### Aliases: lahman lahman_sqlite lahman_postgres lahman_mysql lahman_df
###   copy_lahman has_lahman lahman_srcs
### Keywords: internal

### ** Examples

# Connect to a local sqlite database, if already created
## No test: 
if (has_lahman("sqlite")) {
  lahman_sqlite()
  batting <- tbl(lahman_sqlite(), "Batting")
  batting
}

# Connect to a local postgres database with lahman database, if available
if (has_lahman("postgres")) {
  lahman_postgres()
  batting <- tbl(lahman_postgres(), "Batting")
}
## End(No test)



