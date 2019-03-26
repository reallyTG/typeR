## ----setup, include=TRUE-------------------------------------------------

## ------------------------------------------------------------------------
library(mlbgameday)
library(RSQLite)

# Create an empty database instance.
con <- dbConnect(RSQLite::SQLite(), dbname = "mlbgameday.sqlite3")

# Load the first day of the 2018 season.
get_payload(start = "2018-03-28", end = "2018-03-28", db_con = con)


## ------------------------------------------------------------------------
# Re-connect to database since the get_payload() function closed the connection.
con <- DBI::dbConnect(RSQLite::SQLite(), dbname = "gameday.sqlite3")

# Take a look at our tables.
dbListTables(con)

## ---- eval=FALSE---------------------------------------------------------
#  library(mlbgameday)
#  library(RSQLite)
#  
#  # Log into your database and retreive the most recent date.
#  con <- dbConnect(RSQLite::SQLite(), dbname = "mlbgameday.sqlite3")
#  
#  # Find the last day of data in the current database.
#  db_end <- dbGetQuery(con, "SELECT MAX(date) FROM atbat")
#  
#  # Use the max date +1 as the start date and today -1 for the end date for your new payload.
#  get_payload(start = as.Date(db_end[1,1]) + 1, end = Sys.Date() - 1, db_con = con)

